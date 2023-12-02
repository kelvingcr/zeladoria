import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAvm7pMYOmizooD_LaVL6AWbreqO4Kd0Wg",
            authDomain: "zeladoria-aw0k5z.firebaseapp.com",
            projectId: "zeladoria-aw0k5z",
            storageBucket: "zeladoria-aw0k5z.appspot.com",
            messagingSenderId: "428783439399",
            appId: "1:428783439399:web:55d23fb15cc7dadff84802"));
  } else {
    await Firebase.initializeApp();
  }
}
