import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJ4B7pLhdztXs7onXqRljjTA_y5C3FWco",
            authDomain: "foodiez-c6c62.firebaseapp.com",
            projectId: "foodiez-c6c62",
            storageBucket: "foodiez-c6c62.appspot.com",
            messagingSenderId: "900843291632",
            appId: "1:900843291632:web:f72a4d86b981c5f1b49335"));
  } else {
    await Firebase.initializeApp();
  }
}
