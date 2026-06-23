# secretary_app — Agent Guide

## Quick start

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run            # runs with DevicePreview
flutter analyze        # lint (config: analysis_options.yaml)
flutter test           # only test exists is stale (widget_test.dart references a counter that doesn't exist)
```

## Code generation

- `json_serializable` → edit `@JsonSerializable()` models in `lib/features/*/data/models/*.dart`, then run `dart run build_runner build --delete-conflicting-outputs`
- `flutter_intl` → edit `lib/l10n/intl_*.arb` files (currently empty `{}` stubs), codegen lands in `lib/generated/l10n.dart` and `lib/generated/intl/`. Trigger via `flutter gen-l10n`.

## Architecture

- Feature-first clean-ish layers under `lib/features/{feature}/{data,domain,presentation}/`
  - `data/models/` — `@JsonSerializable()` with `.g.dart` part files
  - `domain/` — usecases, repositories (abstract), entities
  - `presentation/providers/` — Riverpod providers
  - `presentation/screens/` — route targets
  - `presentation/widgets/` — reusable widgets scoped to the feature
- `lib/core/` — shared: `api/`, `theme/`, `utils/`, `widgets/`
- `lib/generated/` — l10n codegen output (do not edit manually)
- Root-level `api_docs/` directory exists alongside `lib/`

## State management

- `flutter_riverpod` throughout. Providers in `features/*/presentation/providers/` and `lib/core/api/api_provider.dart`.

## Routing

- `go_router` via `AppRouter.router` in `lib/core/utils/app_routes.dart`
- Named routes as `AppRoutes` constants — use `context.pushNamed(AppRoutes.xxx)` not raw paths
- The shell route is `MainWrapper` (contains `flutter_floating_bottom_bar` bottom nav)

## API layer

- **Base URL**: `http://127.0.0.1:8000/api/v1/` (hardcoded in `lib/core/api/end_points.dart`)
- HTTP client: `Dio` wrapped in `ApiConsumer`/`DioConsumer`, injected via `apiConsumerProvider` (Riverpod)
- Auth: `TokenManager` in-memory static class (not persisted). Token injected via `ApiInterceptor` as Bearer header.

## Key dev notes

- **Default locale**: `ar` (Arabic). ARB files are empty stubs — after adding strings, run `flutter gen-l10n`.
- **Entrypoint**: `lib/main.dart` wraps app in `DevicePreview` + `ProviderScope`.
- **Theme**: Custom `AppTheme` with both light/dark modes; dark theme is hardcoded as default.
- **Font**: `LamaSans` (Bold 700, Medium 500, Regular 400) in `assets/test/`.
- **Images**: `assets/images/`.

## Testing

- Only the default scaffold test exists (`test/widget_test.dart`) — references a non-existent counter widget, so it will fail if run.
- No integration tests, no CI workflows.
