import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _isInitialized = false;

  AuthProvider() {
    // Initialize immediately without delay
    _initializeAuth();
  }

  void _initializeAuth() {
    // Set initial user from current auth state
    _user = _auth.currentUser;
    _isInitialized = true;
    notifyListeners();

    // Listen for auth state changes
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isInitialized => _isInitialized;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String? get userEmail => _user?.email;
  String? get userName => _user?.displayName ?? _user?.email?.split('@')[0];
}
