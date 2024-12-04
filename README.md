# 🌤️ Clima - iOS Weather App

Clima is a beautiful weather app built for iOS that displays real-time weather conditions for any city or the user's current location. The app uses the OpenWeatherMap API to fetch data and includes features like dark/light mode adaptation, location-based weather, and dynamic animations for an enhanced user experience.

---

## 📸 Screenshots

### Light Mode:
![Light Mode](Clima/light_mode_screenshot.png)

### Dark Mode:
![Dark Mode](Clima/dark_mode_screenshot.png)

---

## ✨ Features

- **Real-Time Weather Updates:** Get live weather updates based on your current location or search by city name.
- **Dynamic Weather Animations:** Visualize the weather with beautiful animations for rain, snow, clouds, and sunshine.
- **Dark & Light Mode:** The app adapts to the system's light or dark mode for a seamless experience.
- **Temperature in Celsius:** Displays temperature in a user-friendly format.
- **Error Handling:** Alerts users if there are network issues or invalid city searches.

---

## 🔧 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/anshusinha26/Clima-iOS-WeatherApp.git

2. Open the project in Xcode:
   ```bash
   cd Clima-iOS-WeatherApp
   open Clima.xcodeproj
   
3. Set up the API Key:
- Open the Secrets.plist file.
- Add your OpenWeatherMap API key under the API_KEY field.

4. Build and run the app:
- Connect your iOS device or simulator.
- Press Cmd + R to run the app.

---

## ⚙️ Tech Stack

- Swift: Core programming language.
- UIKit: For building the user interface.
- CoreLocation: To get the user’s current location.
- OpenWeatherMap API: To fetch real-time weather data.
- Lottie: For lightweight, beautiful animations.

---

## 📂 Project Structure
```graphql
Clima
├── Clima.xcodeproj    # Project file
├── AppDelegate.swift  # App lifecycle
├── SceneDelegate.swift # Scene lifecycle
├── Secrets.plist      # Stores API key
├── WeatherManager.swift # Handles API requests
├── WeatherModel.swift # Weather data model
├── WeatherData.swift  # Weather API response structure
├── Controller         # Contains the main ViewController
└── View               # UI files and assets

