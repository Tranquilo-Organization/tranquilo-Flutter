# 📱  Tranquilo App Overview

This project is a mobile application developed using Flutter, aiming to assist users in managing anxiety through various features. The app provides an accessible platform for users to receive personalized support, interact with a community, and track their mental health progress. It is designed to cater to individuals dealing with anxiety, offering a range of tools to help them better understand and manage their symptoms.

## 🎨  System Design

The app is built using the Clean Architecture pattern, which promotes separation of concerns and makes the codebase more maintainable and testable. This architecture divides the project into three main layers:

UI Layer: Manages the UI and handles user interactions. This layer includes views and widgets.

Logic Layer: Contains state management of app using (flutter_bloc).

Data Layer: Handles data sources such as APIs. This layer includes data models and repositories.

By using Clean Architecture, the project achieves a clear separation between business logic and UI, making it scalable, testable, and easy to maintain.

![system design](https://github.com/user-attachments/assets/6388c2d4-1253-456d-b9f2-12285a8b2cba)


## 📚  Features

- Authentication (Login, Register, Forgot Password):
Secure authentication system allowing users to create an account, log in, and recover their password if needed. This feature ensures the security and privacy of user data.

- Chatbot:
An AI-powered chatbot provides instant support and answers to users' anxiety-related questions. It offers personalized guidance and suggestions based on user input.

- Community:
A safe space where users can interact, share experiences, and support each other. This feature fosters a sense of belonging and reduces the feeling of isolation often associated with anxiety.

- Dashboard:
A personalized dashboard to track user progress, set goals, and view analytics about their anxiety levels and improvements over time.
  
- Home:
The main interface of the app where users can access key features, receive daily tips, and stay updated on their mental health journey.

- Survey:
Regular surveys to help users self-assess their anxiety levels. The results are used to tailor recommendations and content to suit individual needs.

## 🧩  Dependencies

- build_runner: Build System for Dart code generation and modular compilation.
- flutter_bloc: State Management.
- freezed, freezed_annotation: Code Generation.
- get_it: Dependency Injection.
- json_serializable, json_annotation: Automatically generate code for converting to and from JSON.
- dio, retrofit, retrofit_generator, pretty_dio_logger: Networking.
- intl, easy_localization: Localization.
- flutter_native_splash: Splash Screen.
- flutter_svg: SVG Rendering.
- flutter_screenutil: Screen Adaptation.
- cached_network_image: Image Caching.
- flutter_secure_storage: Secure Storage.
- shimmer: Loading Effects.
