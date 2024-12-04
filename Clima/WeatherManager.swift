import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    
    private var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["API_KEY"] as? String else {
            fatalError("API Key not found in Secrets.plist")
        }
        return key
    }
    
    private var weatherURL: String {
        return "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric"
    }
    
    // Fetch weather with city name
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    // Fetch weather with coordinates
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    // Perform network request
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                self.delegate?.didFailWithError(error)
                return
            }
            
            if let safeData = data, let weather = self.parseJson(weatherData: safeData) {
                self.delegate?.didUpdateWeather(self, weather: weather)
            }
        }
        task.resume()
    }
    
    // Parse JSON to WeatherModel
    func parseJson(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(
                conditionId: decodedData.weather[0].id,
                cityName: decodedData.name,
                temperature: decodedData.main.temp
            )
            return weather
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
