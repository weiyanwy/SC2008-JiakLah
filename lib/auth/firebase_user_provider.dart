import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FoodiezFirebaseUser {
  FoodiezFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

FoodiezFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FoodiezFirebaseUser> foodiezFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FoodiezFirebaseUser>(
      (user) {
        currentUser = FoodiezFirebaseUser(user);
        return currentUser!;
      },
    );
