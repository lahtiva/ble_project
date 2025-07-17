A quick demo of using Kotlin plugins, instead of injecting code straight from the MainActivity. (https://docs.flutter.dev/packages-and-plugins/developing-packages)

Probably contains a lot of junk and unnecessary files, but hopefully conveys the idea somewhat.


To run: `flutter run -d android` or similar
Clicking the button in the UI starts scanning BL devices and creates a push notification.
The BL scanning continues in the background if navigated away from the app, or if closed entirely. The notification doesn't seem to be persistent.
