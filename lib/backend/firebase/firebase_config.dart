import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDEVpzxru_WSqocCet9NInqhsmmGI2XbQg",
            authDomain: "driftr-balloon.firebaseapp.com",
            projectId: "driftr-balloon",
            storageBucket: "driftr-balloon.appspot.com",
            messagingSenderId: "539528718301",
            appId: "1:539528718301:web:0562ec7a218194cf96f834",
            measurementId: "G-250BHCNZXM"));
  } else {
    await Firebase.initializeApp();
  }
}
