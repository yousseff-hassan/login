# Login Screen – Flutter UI Task

شاشة تسجيل دخول (Login Screen) متجاوبة (Responsive) اتبنيت بـ Flutter، مقسمة على شكل ويدجتس قابلة لإعادة الاستخدام (Reusable Widgets) وهيكل مجلدات نضيف وسهل التوسع فيه.


## Screenshots

| Login Screen |
|:---:|
| ![Login Screen](screenshots/login.png) |
## Demo & APK

- **Download APK:** [Click here to download app-release.apk](https://drive.google.com/file/d/13EuTg15xaP2LZdYxEk8UYX06rn9IZcPm/view?usp=drive_link)

## المميزات

- **Responsive Design**: الشاشة بتتكيف مع أحجام الشاشات المختلفة (موبايل / تابلت / ويب) باستخدام `MediaQuery` و `LayoutBuilder`.
- **Reusable Widgets**: `CustomTextField`, `CustomButton` قابلة للاستخدام في أي شاشة تانية.
- **Form Validation**: تحقق من صحة الإيميل والباسورد قبل الإرسال.
- **Clean Folder Structure**: فصل الـ core (constants/utils) عن الـ widgets عن الـ screens.

## هيكل المشروع

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   ├── app_colors.dart       # ألوان التطبيق
│   │   └── app_text_styles.dart  # أنماط النصوص
│   └── utils/
│       └── validators.dart       # دوال التحقق من صحة البيانات
├── widgets/
│   ├── custom_text_field.dart    # حقل نص قابل لإعادة الاستخدام
│   └── custom_button.dart        # زرار قابل لإعادة الاستخدام
└── screens/
    └── login/
        ├── login_screen.dart     # الشاشة الرئيسية
        └── widgets/
            └── login_header.dart # الهيدر العلوي (لوجو + ترحيب)
```

## طريقة التشغيل

```bash
git clone <repo-url>
cd flutter_login_ui
flutter pub get
flutter run
```

## Tech Stack

- Flutter (Material 3)
- Dart

## ملاحظات

- المشروع من غير أي state management إضافي (زي Provider/Bloc) لأن الشاشة واحدة بس، ولو اتوسع المشروع في المستقبل ممكن نضيفه بسهولة بفضل الهيكل الحالي.
- الـ Login بتاعت الـ API/Backend مش متوصلة فعليًا، فيه `TODO` مكانها جوه `login_screen.dart` في دالة `_handleLogin`.
