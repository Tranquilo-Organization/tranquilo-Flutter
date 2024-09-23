# 📱  Tranquilo App Overview

This project is a mobile application developed using Flutter, aiming to assist users in managing anxiety through various features. The app provides an accessible platform for users to receive personalized support, interact with a community, and track their mental health progress. It is designed to cater to individuals dealing with anxiety, offering a range of tools to help them better understand and manage their symptoms.

## 🎨  System Design

The app is built using the Clean Architecture pattern, which promotes separation of concerns and makes the codebase more maintainable and testable. This architecture divides the project into three main layers:

UI Layer: Manages the UI and handles user interactions. This layer includes views and widgets.

Logic Layer: Contains state management of app using (flutter_bloc).

Data Layer: Handles data sources such as APIs. This layer includes data models and repositories.

By using Clean Architecture, the project achieves a clear separation between business logic and UI, making it scalable, testable, and easy to maintain.

![system design](https://github.com/user-attachments/assets/6388c2d4-1253-456d-b9f2-12285a8b2cba)

## 📥  Installation

1. **Clone the Repo:**

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/Tranquilo-Organization/tranquilo-Flutter.git

2. **Install Dependencies:**
   ```bash
   flutter pub get

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

The project utilizes various dependencies to enhance functionality and streamline development. These dependencies may be expanded as the project evolves:

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
- Lottie: Loading Animations Effects.

## 📸 Tranquilo App Demo 

https://github.com/user-attachments/assets/16e7d704-596a-4bac-a052-c6dc6cb9455e

## 📱 Tranquilo App Screens 

## Splash & OnBoarding 
>>>>>>> master
<img width="409" alt="Screenshot 2024-09-23 at 4 03 10 AM" src="https://github.com/user-attachments/assets/a394333d-497a-4148-b3a6-cff89bf3213a">

<img width="408" alt="Screenshot 2024-09-23 at 4 03 48 AM" src="https://github.com/user-attachments/assets/3929d175-b8dd-4798-a074-21cb7f7f7605">

<img width="413" alt="Screenshot 2024-09-23 at 4 04 19 AM" src="https://github.com/user-attachments/assets/49e223f6-23f9-4802-9078-61b33cfe918d">

<img width="411" alt="Screenshot 2024-09-23 at 4 05 09 AM" src="https://github.com/user-attachments/assets/ed699706-1b23-46fb-a5cb-63329f1b1c6e">

## Authentication

<img width="419" alt="Screenshot 2024-09-23 at 4 05 34 AM" src="https://github.com/user-attachments/assets/3a59ee38-aa92-4d78-8642-c8399350751d">

<img width="419" alt="Screenshot 2024-09-23 at 4 06 09 AM" src="https://github.com/user-attachments/assets/1a4cd4e1-2b4c-4d5b-ab75-d2aff544e172">

<img width="419" alt="Screenshot 2024-09-23 at 4 06 35 AM" src="https://github.com/user-attachments/assets/b604161d-ff01-401a-b3e6-7d1f55f1ffd7">

<img width="413" alt="Screenshot 2024-09-23 at 4 37 06 AM" src="https://github.com/user-attachments/assets/4f177461-12a9-43af-bc4e-281561075981">

<img width="421" alt="Screenshot 2024-09-23 at 4 38 04 AM" src="https://github.com/user-attachments/assets/b2ec6bc1-6526-4960-90a1-0918e1183c20">

## Survey

<img width="428" alt="Screenshot 2024-09-23 at 4 38 53 AM" src="https://github.com/user-attachments/assets/b25b382b-40e9-4f4e-89e2-58bcc2dc4b5c">


<img width="421" alt="Screenshot 2024-09-23 at 4 39 21 AM" src="https://github.com/user-attachments/assets/7393b04d-ad96-4321-99e5-6971f8f72acd">

<img width="428" alt="Screenshot 2024-09-23 at 4 39 58 AM" src="https://github.com/user-attachments/assets/a6374365-a467-4bb0-9a90-93b04dbbeec2">


<img width="422" alt="Screenshot 2024-09-23 at 4 40 45 AM" src="https://github.com/user-attachments/assets/2b6b11ce-4337-4318-bed7-b654ae13776b">


<img width="421" alt="Screenshot 2024-09-23 at 4 41 15 AM" src="https://github.com/user-attachments/assets/c7fab891-8830-49f3-a18e-a2da49f42dbb">

<img width="419" alt="Screenshot 2024-09-23 at 4 41 34 AM" src="https://github.com/user-attachments/assets/6ad2e2b2-8a68-452e-9164-784f32551b91">

## Home & Routines

<img width="424" alt="Screenshot 2024-09-23 at 4 42 01 AM" src="https://github.com/user-attachments/assets/4d059176-8aeb-4c69-a193-90eda7bb799e">


<img width="426" alt="Screenshot 2024-09-23 at 4 42 35 AM" src="https://github.com/user-attachments/assets/0da6fd83-8e17-4c33-baa2-95c1c0a4a0ba">


<img width="427" alt="Screenshot 2024-09-23 at 4 42 59 AM" src="https://github.com/user-attachments/assets/4d2fdb10-5226-4b8a-b923-5e20d716954c">

## ChatBot

<img width="419" alt="Screenshot 2024-09-23 at 4 43 29 AM" src="https://github.com/user-attachments/assets/55f0d0b2-ea98-414b-bc26-cd8932ee1989">

<img width="421" alt="Screenshot 2024-09-23 at 4 43 50 AM" src="https://github.com/user-attachments/assets/a85f4521-891c-46fd-9c32-5acd58a984a4">

## DashBoard

<img width="420" alt="Screenshot 2024-09-23 at 4 44 10 AM" src="https://github.com/user-attachments/assets/b4c0975e-e603-40b5-9d41-62c2de3ea91b">

## Community


<img width="417" alt="Screenshot 2024-09-23 at 4 44 34 AM" src="https://github.com/user-attachments/assets/5948e8e1-be97-4e91-b2fb-c2b63d7326a3">

<img width="425" alt="Screenshot 2024-09-23 at 4 45 02 AM" src="https://github.com/user-attachments/assets/ef3e5966-6a12-4e24-9f4b-62e58b8ba9c0">

<img width="416" alt="Screenshot 2024-09-23 at 4 45 30 AM" src="https://github.com/user-attachments/assets/75955be2-e570-4a5d-918b-cddec0b956c9">

<img width="426" alt="Screenshot 2024-09-23 at 4 46 05 AM" src="https://github.com/user-attachments/assets/3052666f-5f19-496e-8a24-f7413c0cc53b">

## Profile & Settings

<img width="419" alt="Screenshot 2024-09-23 at 4 46 26 AM" src="https://github.com/user-attachments/assets/4c83aefa-da91-4101-bc3b-e0479c855b7b">

<img width="425" alt="Screenshot 2024-09-23 at 4 47 13 AM" src="https://github.com/user-attachments/assets/55a672d1-9bbf-42bd-a980-4b50388d3feb">


<img width="420" alt="Screenshot 2024-09-23 at 4 47 35 AM" src="https://github.com/user-attachments/assets/e666dcd4-57b2-4214-bfcf-a4b0da261a19">



<img width="424" alt="Screenshot 2024-09-23 at 4 47 54 AM" src="https://github.com/user-attachments/assets/601fb946-4456-413c-b34f-5b2f9f421ea7">

<img width="424" alt="Screenshot 2024-09-23 at 4 48 22 AM" src="https://github.com/user-attachments/assets/faef4c23-dd61-4552-a745-94e16db21591">
