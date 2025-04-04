# MYPCOT Customer Management App

## Overview
This is a Flutter-based customer management application that provides a clean dashboard interface for tracking customers, orders, and related metrics. The app features a modern UI with intuitive navigation and real-time data visualization.

## Screenshots
![Dashboard Interface](placeholder-dashboard.png)

## Features
- **Customer Analytics Dashboard**: Track new customers, active customers, and growth metrics
- **Order Management**: Create and track orders through the system
- **Calendar Integration**: View scheduled activities with highlighted dates
- **Timeline View**: Track activities chronologically

## 📸 Screenshots

### 🔻 Splash Screen
![Splash Screen](asset/WhatsApp%20Image%202025-04-04%20at%2014.03.41_aef3d24f.jpg)

### 🏠 Home Screen
![Home Screen](asset/WhatsApp%20Image%202025-04-04%20at%2014.03.42_bcd5604a.jpg)

---

## Project Structure
```
mypcot_assessment/
├── android/            # Android-specific configuration
├── ios/                # iOS-specific configuration
├── lib/
│   ├── controller/     # State management controllers
│   │   └── state_controller.dart
│   ├── modal/          # Data models
│   └── view/           # UI components
│       └── home_page/
│           ├── home_page.dart
│           └── widget/
│               ├── bottom_navigation_bar.dart
│               ├── calendar.dart
│               └── carousel.dart
├── build/              # Build outputs
├── assets/             # Static assets and resources
└── main.dart           # Entry point
```

## State Management
The application uses ValueNotifier for state management, providing a lightweight solution for reactive UI updates without complex architecture.

## Dependencies
- `flutter/material.dart`: Material Design components
- `google_fonts`: Typography customization
- `animate_do`: Animation effects for smooth UI transitions

## Color Scheme
- Primary Color: `#FF273D66` (Dark Blue)
- Accent Color: `#FFFF6C35` (Orange)
- Calendar Highlight: `#FF10817E` (Teal)
- Background: Custom light shade `fromARGB(255, 245, 249, 249)`

## UI Components
1. **DashboardPage**: Main container widget that displays customer metrics
2. **BottomNavigationBar**: Custom navigation with Home, Customers, Khata, and Orders tabs
3. **Calendar**: Date selection widget with highlighted dates
4. **Carousel**: Sliding cards displaying metrics and statistics

## Navigation
The app implements a NavigationController to handle transitions between different screens and maintain state across the application.

## Getting Started

### Prerequisites
- Flutter SDK (2.5.0 or higher)
- Dart SDK (2.14.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation
1. Clone the repository:
   ```
   git clone https://github.com/yourusername/mypcot_assessment.git
   ```

2. Navigate to project directory:
   ```
   cd mypcot_assessment
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   flutter run
   ```

## Development Guidelines
- Follow the existing project structure for new features
- Use ValueNotifier for state management
- Maintain widget-level separation for better reusability
- Document all major components and functions

## Build and Deployment
```
flutter build apk --release  # For Android
flutter build ios --release  # For iOS
```

## Contributing
1. Fork the repository
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add some amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request
