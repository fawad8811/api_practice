# hiring_task_fawad

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
Flutter MVVM Application

This is a Flutter project designed with the MVVM (Model-View-ViewModel) architecture. It leverages clean code principles, modular design, and efficient state management to create a scalable and maintainable application.

Features

Core Functionality

Splash Screen: Provides an engaging entry point to the application.

Authentication: Includes Sign Up and Login screens with form validation.

Navigation: Offers a NavBar screen to access core sections such as Home and Profile.

Home Screen: Displays user-specific data fetched from the backend.

Profile Screen: Allows users to view and update their personal details.

Architecture Highlights

MVVM Architecture: Separates UI logic from business logic for better maintainability.

State Management: Implements reactive programming to ensure the UI updates dynamically with data changes.

Data Handling: Fetches, maps, and displays user data seamlessly.

Folder Structure

The project adheres to a modular folder structure to promote clarity and scalability:

lib/
|-- api_helper/       # API integration and helper methods
|-- generated/        # Auto-generated assets
|-- model/            # Data models
|-- repository/       # Data repositories
|-- screens/          # UI screens
|   |-- splash_screen.dart
|   |-- login_screen.dart
|   |-- signup_screen.dart
|   |-- home_screen.dart
|   |-- profile_screen.dart
|   |-- navbar_screen.dart
|-- viewmodel/        # ViewModel classes
|   |-- user_viewmodel.dart
|-- main.dart         # Entry point of the application

Screens Overview

Splash Screen

Handles initialization and navigation to the appropriate screen (Login/Sign Up or Home).

Login Screen

Validates user input for email and password.

Redirects authenticated users to the Home Screen.

Sign Up Screen

Allows new users to register.

Implements field validations and password matching.

Includes country picker for phone number input.

NavBar Screen

A bottom navigation bar for seamless access to major sections.

Home Screen

Displays dynamic content fetched from the backend.

Provides a clean and responsive UI.

Profile Screen

Fetches and displays user profile data.

Allows users to update their information.

Dependencies

GetX: For state management, navigation, and dependency injection.

Country Picker: To select country codes.

Flutter SVG: For displaying SVG assets.

Setup and Installation

Install dependencies:

flutter pub get

Run the application:

flutter run

Development Guidelines

Code Standards

Follow MVVM principles strictly to separate UI, business logic, and data handling.

Use reactive programming for seamless state updates.

Testing

Ensure all validations and API integrations are thoroughly tested.

Write unit tests for ViewModel methods and repository logic.

Future Enhancements

Add more advanced authentication methods (e.g., OTP-based login).

Implement a settings screen for user preferences.

Introduce offline data storage for improved performance.

Enhance UI/UX with animations and transitions.

Contributing

Contributions are welcome! To contribute:

Create a new branch:

git checkout -b feature/your-feature-name

Commit your changes:

git commit -m "Add your message here"

Push your branch and open a pull request.

