# Build android
flutter clean
flutter pub get
flutter build apk --release --target-platform android-arm64flutter build apk --release --target-platform android-arm64

# Build bundle
flutter clean
flutter pub get
flutter build appbundle 

# Build iOS
flutter clean
flutter pub get
flutter build ios

# Build runner
dart run build_runner build --delete-conflicting-outputs

# Generate localizatiom
flutter gen-l10n

# Change package name
dart run change_app_package_name:main com.package.name

# Generate splash screen
dart run flutter_native_splash:create

# Generate app icon
dart run flutter_launcher_icons:generate