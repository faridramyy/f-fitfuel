# fitfuel

A professional AI-powered fitness application for workout tracking, diet planning, and personalized training.

## Project Overview

FitFuel is an AI-driven fitness application designed to help users achieve their health goals. It features workout tracking, diet planning, diet tracking, and AI-powered custom training. The app is built with Flutter, ensuring cross-platform compatibility and a seamless user experience.

## Features

- **Feature-Based Architecture**: Each feature is self-contained with its own widgets, models, and services.
- **Reusable Components**: Core utilities and shared widgets for consistent UI and functionality.
- **Theming and Localization**: Centralized theme management and support for multiple languages.
- **Cross-Platform Support**: Runs seamlessly on Android, iOS, web, and desktop platforms.

## File Structure

```
fitfuel/
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
├── assets/
│   ├── images/
│   │   ├── app_logo_dark.png
│   │   ├── app_logo_white.png
│   ├── icons/
│   ├── fonts/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_strings.dart
│   │   ├── utils/
│   │   │   ├── validators.dart
│   │   │   ├── extensions.dart
│   │   ├── widgets/
│   │   │   ├── custom_button.dart
│   │   │   ├── custom_text_field.dart
│   ├── features/
│   │   ├── home/
│   │   │   ├── widgets/
│   │   │   │   ├── home_card.dart
│   │   │   ├── models/
│   │   │   │   ├── home_model.dart
│   │   │   ├── services/
│   │   │   │   ├── home_service.dart
│   │   │   ├── home_page.dart
│   │   ├── profile/
│   │   │   ├── widgets/
│   │   │   │   ├── profile_avatar.dart
│   │   │   ├── models/
│   │   │   │   ├── user_model.dart
│   │   │   ├── services/
│   │   │   │   ├── profile_service.dart
│   │   │   ├── profile_page.dart
│   ├── shared/
│   │   ├── themes/
│   │   │   ├── app_theme.dart
│   │   ├── localization/
│   │   │   ├── app_localizations.dart
├── test/
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
```

## Getting Started

### Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install) and set up your development environment.
- Ensure you have the latest version of Dart.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/faridramyy/f-fitfuel.git
   ```
2. Navigate to the project directory:
   ```bash
   cd f-fitfuel
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

- For Android:
  ```bash
  flutter run -d android
  ```
- For iOS:
  ```bash
  flutter run -d ios
  ```
