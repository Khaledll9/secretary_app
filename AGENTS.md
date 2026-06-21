# secretary_app — Agent Guide

## Quick start

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run          # runs with DevicePreview
flutter analyze      # lint (config: analysis_options.yaml)
flutter test         # only test exists is stale (widget_test.dart references a counter that doesn't exist)
```

## Code generation

- `json_serializable` -> edit `@JsonSerializable()` models in `lib/**/data/models/*.dart`, then run `dart run build_runner build --delete-conflicting-outputs`
- `flutter_intl` -> edit `lib/l10n/intl_*.arb` files, codegen output lands in `lib/generated/l10n.dart` and `lib/generated/intl/`. Trigger via Flutter Intl plugin or `flutter gen-l10n`.

## Architecture

- `/lib` — feature-first clean-ish layers: `features/{feature}/{data,domain,presentation}/`
  - `data/models/` — `@JsonSerializable()` with `.g.dart` part files
  - `domain/` — usecases, repositories (abstract), entities
  - `presentation/providers/` — Riverpod providers
  - `presentation/screens/` — screens (route targets)
  - `presentation/widgets/` — reusable widgets
- `/lib/core/` — shared: `api/`, `theme/`, `utils/`, `widgets/`
- `/lib/generated/` — l10n codegen output (do not edit manually)

## State management

- `flutter_riverpod` throughout
- Providers in `features/*/presentation/providers/` and `lib/core/`

## Routing

- `go_router` via `AppRouter.router` in `lib/core/utils/app_routes.dart`
- Named routes defined as `AppRoutes` constants — use `context.pushNamed(AppRoutes.xxx)` not raw paths

## API layer

- **Base URL**: `http://127.0.0.1:8000/api/v1/` (hardcoded in `lib/core/api/end_points.dart`)
- HTTP client: `Dio` wrapped in `ApiConsumer` / `DioConsumer` (injected via `apiConsumerProvider` Riverpod provider)
- Auth: `TokenManager` in-memory static class (not persisted). Token injected via `ApiInterceptor` as Bearer header.

## Key dev notes

- **Default locale**: `ar` (Arabic). ARB files (`intl_ar.arb`, `intl_en.arb`) are currently empty placeholder stubs.
- **Entrypoint**: `lib/main.dart` wraps the app in `DevicePreview` + `ProviderScope`.
- **Theme**: Custom `AppTheme` with light/dark modes (switchable via `themeModeProvider`).
- **Font**: `LamaSans` (Bold 700, Medium 500, Regular 400) in `assets/test/`.
- **Images**: `assets/images/`.

## Testing

- The repo only has the default scaffold test (`test/widget_test.dart`) — it references a counter widget that doesn't exist, so it will **fail** if run as-is.
- No integration test setup, no `.github/` CI workflows.
