.PHONY: setup
setup:
	fvm flutter pub get
	fvm dart run flutter_launcher_icons
    dart run flutter_native_splash:create

submit_android:
	flutter clean
	flutter pub get
	fvm flutter build appbundle --dart-define-from-file=dart_defines/prod.env
