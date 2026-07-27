# FAD Qualification Challenge — Flutter Login Screen

A responsive Flutter login screen built with clean, feature-based
folder structure and reusable widgets.

## Features

- Responsive layout using `flutter_screenutil` — adapts consistently
  across different screen sizes and resolutions.
- Reusable widgets (`BasicButton`, `BasicTextField`, `BasicTxt`) shared
  across the login screen.
- State management with Cubit (`login_cubit.dart`, `login_states.dart`).
- Clean separation between data (model/repository) and presentation
  (views/viewModel) layers.

## Folder Structure

```
lib/
├── core/
│   ├── errors/
│   │   └── failure.dart
│   ├── sharedWidgets/
│   │   ├── basic_button.dart
│   │   ├── basic_colors.dart
│   │   ├── basic_txt.dart
│   │   └── basic_txt_field.dart
│   └── utils/
│       └── appImages/
│           └── png_images.dart
├── features/
│   └── login/
│       ├── data/
│       │   ├── model/
│       │   │   └── login_model.dart
│       │   └── repository/
│       │       ├── login_repo.dart
│       │       └── login_repo_impl.dart
│       └── presentation/
│           ├── viewsModel/
│           │   ├── login_cubit.dart
│           │   └── login_states.dart
│           └── views/
│               ├── login_view.dart
│               └── widgets/
│                   ├── continue_with_face.dart
│                   ├── continue_with_google.dart
│                   ├── login_button.dart
│                   └── remember_me.dart
├── root/
│   └── app_root.dart
└── main.dart
```


## Getting Started

```bash
flutter pub get
flutter run
```

## Screenshot

![Login Screen](Screenshot%202026-07-26%20231013.png)

## Tech

- Flutter & Dart
- Cubit (state management)
- flutter_screenutil (responsive design)
