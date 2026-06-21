<p align="center">
  <img src="assets/images/logo.png" alt="Secretary App Logo" width="120" height="120" />
</p>

<h1 align="center">📋 Secretary App</h1>

<p align="center">
  <strong>Comprehensive Administrative Dashboard for Educational Institutes</strong>
  <br />
  Manage courses, bookings, attendance, reports, and notifications — all from one powerful mobile interface.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.29-02569B?logo=flutter&logoColor=white" alt="Flutter 3.29" />
  <img src="https://img.shields.io/badge/Dart-3.11-0175C2?logo=dart&logoColor=white" alt="Dart 3.11" />
  <img src="https://img.shields.io/badge/version-1.0.0+1-blue" alt="Version 1.0.0" />
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License MIT" />
  <img src="https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey" alt="Multi-platform" />
  <img src="https://img.shields.io/badge/state_management-Riverpod-red?logo=riverpod" alt="Riverpod" />
</p>

---

## 📖 About The Project

**Secretary App** is a full-featured administrative mobile application designed for secretaries and administrators of educational institutes. It streamlines day-to-day operations by centralizing **course management**, **student booking & attendance**, **financial reporting**, and **in-app notifications** into a single, intuitive interface.

Built with **Flutter** and a **Clean Architecture** approach, the app delivers a native-quality experience across Android, iOS, Web, and Desktop from a single codebase. The Arabic-first interface (with English localization ready) makes it ideal for institutes in the MENA region.

### 🎯 Who Is It For?

- 🏫 Educational institute secretaries & administrators
- 👨‍🏫 Training center operation managers
- 📊 Department heads who need real-time KPIs and reports

---

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| 🔐 **Authentication** | Secure sign-in/sign-up with token-based session management |
| 📚 **Course Management** | Create, update, toggle status, and browse courses with rich details |
| 📅 **Booking System** | Add, view, filter, and manage student bookings with attendance confirmation |
| 👤 **Student Profiles** | View student info, payment breakdowns, and booking history per session |
| 📊 **Reports & KPIs** | Dashboard with KPIs, top performers, course-specific stats, and booking reports |
| 🔔 **Notifications** | Create and broadcast in-app notifications to students |
| 🏛️ **Institute Info** | Display institute details, specialties, location map, and contact info |
| 🌙 **Dark / Light Mode** | Fully themed with system-aware dark/light mode toggle |
| 🌐 **Arabic-First UI** | RTL layout with Arabic as default locale (English ready via Flutter Intl) |

---

## 🏗️ Architecture & Tech Stack

### Architecture

The project follows **Clean Architecture** with feature-first organization, separating each domain into three layers:

```
lib/
├── core/               # Shared foundation
│   ├── api/            # Dio client, interceptors, token manager, endpoints
│   ├── theme/          # Light/dark themes, colors, text styles
│   ├── utils/          # GoRouter configuration & named routes
│   └── widgets/        # Shared widgets (main wrapper, bottoms, search)
│
├── features/           # Feature modules
│   ├── add_booking/
│   ├── add_course/
│   ├── booking/
│   ├── course_details/
│   ├── home/
│   ├── institute/
│   ├── my_courses/
│   ├── notifications/
│   ├── onboarding/
│   ├── profile/
│   ├── reports/
│   └── singin/
│       ├── data/            # Models (JSON serializable), repositories
│       ├── domain/          # Entities, repository contracts, use cases
│       └── presentation/    # Providers (Riverpod), screens, widgets
│
├── generated/          # Flutter Intl codegen output (do not edit)
├── l10n/               # ARB localization files (intl_ar.arb, intl_en.arb)
└── main.dart           # App entrypoint
```

### 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.29 (Dart 3.11) |
| **State Management** | [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) ^3.3.1 |
| **Routing** | [go_router](https://pub.dev/packages/go_router) ^17.2 (named routes) |
| **Networking** | [Dio](https://pub.dev/packages/dio) ^5.9 + custom `ApiConsumer` abstraction |
| **Serialization** | [json_serializable](https://pub.dev/packages/json_serializable) + [build_runner](https://pub.dev/packages/build_runner) |
| **Localization** | [Flutter Intl](https://pub.dev/packages/intl) (Arabic default, English ready) |
| **UI Utilities** | [DevicePreview](https://pub.dev/packages/device_preview), [flutter_floating_bottom_bar](https://pub.dev/packages/flutter_floating_bottom_bar) |
| **Image Picker** | [image_picker](https://pub.dev/packages/image_picker) ^1.2 |
| **Font** | LamaSans (Bold, Medium, Regular) |
| **Design** | Custom theme system with light/dark `ColorScheme` |

---

## 🚀 Getting Started

### Prerequisites

- **Flutter** 3.29+ ([install guide](https://docs.flutter.dev/get-started/install))
- **Dart** 3.11+ (bundled with Flutter)
- **Backend API** running at `http://127.0.0.1:8000/api/v1/` (see `api_docs/` for the Postman collection)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/secretary_app.git
cd secretary_app

# 2. Install dependencies
flutter pub get

# 3. Generate JSON serialization code
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

> **Note**: The app connects to a local backend at `http://127.0.0.1:8000/api/v1/` by default. Update the base URL in `lib/core/api/end_points.dart` to point to your server.

### Code Generation

Whenever you modify `@JsonSerializable()` models or ARB localization files:

```bash
# After editing models in lib/**/data/models/*.dart
dart run build_runner build --delete-conflicting-outputs

# After editing lib/l10n/intl_*.arb files
flutter gen-l10n
```

### Useful Commands

```bash
flutter analyze        # Run static analysis (linter)
flutter test           # Run tests (note: default test is stale)
flutter run --release  # Build release mode
```

---

## 📸 Screenshots & Demo

<!-- TODO: Add app screenshots here -->
<!--
<p align="center">
  <img src="screenshots/home.png" width="200" />
  <img src="screenshots/bookings.png" width="200" />
  <img src="screenshots/reports.png" width="200" />
</p>
-->

*A video walkthrough is coming soon.*

---

## 🧪 Testing

The repository currently includes the default Flutter scaffold test (`test/widget_test.dart`) which references a counter widget that does not exist in this project and will **fail** if run as-is.

Planned:
- Unit tests for domain use cases
- Widget tests for key screens
- Integration tests for critical user flows

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please ensure your code passes `flutter analyze` before submitting.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 📬 Contact & Support

**Project Maintainer** — [Your Name]

- 📧 Email: your.email@example.com
- 💼 LinkedIn: [linkedin.com/in/your-profile](https://linkedin.com/in/your-profile)
- 🐙 GitHub: [@your-username](https://github.com/your-username)

<p align="center">
  Made with ❤️ for educational institutes
</p>
