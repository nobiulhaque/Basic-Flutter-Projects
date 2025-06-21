# 📱 Basic Flutter Projects

Welcome to **Basic Flutter Projects**! This repository contains a collection of simple and fun mobile applications developed using Flutter. Each project is designed to help beginners practice core Flutter concepts like widgets, navigation, state management, and user input.

---

## 🚀 Projects Included

# 📝 Flutter Notes App

A beautiful, color-coded note-taking application built with Flutter and SQLite for local storage.

![App Screenshot](screenshot.png) <!-- Add your screenshot here -->

## ✨ Features

- **Color-coded notes** - Organize with 7 vibrant colors
- **CRUD Operations** - Create, Read, Update, Delete notes
- **Responsive Grid View** - Adaptive layout for all screen sizes
- **Dark/Light Theme** - Automatic system theme detection
- **Local Storage** - SQLite database persistence
- **Intuitive UI** - Clean Material Design interface

## 🛠️ Tech Stack

- **Flutter** 3.x
- **sqflite** - Local SQLite database
- **intl** - Date formatting
- **Material Design** Components

## 📁 Project Structure

```text
notes_app/
├── android/               # Android platform-specific files
│   ├── app/               # Android app module
│   └── gradle/            # Gradle wrapper files
├── ios/                   # iOS platform-specific files
│   ├── Runner/            # iOS app bundle
│   └── Podfile            # CocoaPods dependencies
├── lib/                   # Main application code
│   ├── screens/           # UI screens
│   │   ├── notes_screen.dart  # Main notes interface (StatefulWidget)
│   │   ├── note_card.dart     # Individual note card (StatelessWidget) 
│   │   └── note_dialog.dart   # Add/edit dialog (StatefulWidget)
│   ├── database/          # Data layer
│   │   └── notes_database.dart # SQLite database helper (Singleton)
│   └── main.dart          # App entry point (StatelessWidget)
├── pubspec.yaml           # Flutter dependencies/config
└── README.md             # Project documentation 

---
### 🎲 2. Dice Rolling App
A fun app that simulates dice rolling.
- Random number generation
- Gesture detection
- Image assets and basic animation

### 🔢 3. Calculator App
A simple calculator that performs basic arithmetic operations.
- Buttons grid layout
- Stateful widget logic
- String parsing for math operations

### ✅ 4. To-Do App
A task manager to keep track of daily activities.
- Add/remove/complete tasks
- Dynamic UI updates
- List and checkbox widgets

### 🏃‍♂️ 5. Health Tracking App
A lightweight health tracker to log activities.
- Track steps, water intake, and workouts
- Progress indicators
- Simple data visualization

---

## 🛠️ Tech Stack
- **Flutter**: UI toolkit for building natively compiled applications
- **Dart**: Programming language used with Flutter

---

## 📦 Requirements
- Flutter SDK
- Android Studio or VS Code with Flutter & Dart plugins
- A real device or emulator

---
