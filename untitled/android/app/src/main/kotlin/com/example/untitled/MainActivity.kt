package com.example.untitled

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS) SharedPreferencesIOS.registerWith();
}
