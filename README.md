# Weather App

A Flutter-based mobile application that provides real-time weather information and forecasts.

## Features

- View current weather conditions including temperature, humidity, and wind speed
- Check hourly and daily weather forecasts
- Search for weather information by city name
- Clean and intuitive user interface

### Prerequisites

To run this project, you need to have the following installed on your system:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- An API key from OpenWeatherMap

### Installation

Clone the repository: git clone https://github.com/Abi27052000/WeatherApp.git

### Project Structure

lib/

- ├── main.dart
- ├── weather_screen.dart
- ├── hourly_forecast_item.dart
- ├── additional_information_item.dart
- └── secret.dart

<br><br>

- main.dart: Entry point of the application
- weather_screen.dart: Main screen showing weather information
- hourly_forecast_item.dart: Widget for hourly forecast items
- additional_information_item.dart: Widget for additional weather details
- secret.dart: Contains the API key (not tracked in version control)

### Usage

- Launch the app on your device or emulator.
- The app will display the weather for a default city (e.g., London).
- View the current weather, hourly forecast, and additional weather details.

### Dependencies

- http: ^1.2.1 - For making API calls
- intl: ^0.19.0 - For date formatting

### API KEY

- This app uses the OpenWeatherMap API to fetch weather data. You need to obtain an API key from OpenWeatherMap and add it to the secret.dart file as mentioned in the installation steps.

### Acknowledgements

- OpenWeatherMap for providing the weather data API
- Flutter for the amazing cross-platform framework
