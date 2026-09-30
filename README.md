# To-Do App

A minimal to-do list app built with Flutter, with tasks saved on the device using Hive.

## Features

- Create tasks from a dialog
- Mark tasks as done with a checkbox
- Tasks **persist locally** with the Hive key-value database

## Tech stack

- Flutter / Dart
- Hive (local storage)

## Getting started

Requires the [Flutter SDK](https://docs.flutter.dev/get-started/install).

```bash
git clone https://github.com/diegoabreug/todo-app.git
cd todo-app
flutter pub get
flutter run
```

## Project structure

```
lib/
├── main.dart             # Initializes Hive and launches the app
├── data/database.dart    # Load/save tasks to Hive
├── components/           # Dialog, button, task tile widgets
└── screens/home_screen.dart
```

## Author

**Diego Abreu** · [GitHub](https://github.com/diegoabreug)
