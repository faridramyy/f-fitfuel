import 'package:firebase_auth/firebase_auth.dart';

class OnboardingController {
  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }
}

