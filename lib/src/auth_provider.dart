import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This class manages everything about who is logged in.
// ChangeNotifier means: when something changes, all screens that 
// are "watching" this will automatically update.
class AuthProvider extends ChangeNotifier {

  // The name of whoever is logged in. null = nobody logged in yet.
  String? userName;

  // The role: 'student' or 'club_leader'
  String? userRole;

  // Simple check: is someone logged in?
  bool get isLoggedIn => userName != null;

  // ── Hardcoded test accounts (no mock data file needed) ──────────────
  // These are the only emails that will work to log in.
  // Format: 'email' : {'password': '...', 'role': '...', 'name': '...'}
  final Map<String, Map<String, String>> _testAccounts = {
    'student@alustudent.com': {
      'password': 'password123',
      'role': 'student',
      'name': 'Ralph Mugisha',
    },
    'leader@alustudent.com': {
      'password': 'password123',
      'role': 'club_leader',
      'name': 'Ishimwe Kevin',
    },
  };

  // ── Called once when the app opens ──────────────────────────────────
  // Checks if the user was already logged in before (saved on phone)
  Future<void> loadSavedLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('userName');
    final savedRole = prefs.getString('userRole');

    // If we find a saved name, restore the login
    if (savedName != null && savedRole != null) {
      userName = savedName;
      userRole = savedRole;
      notifyListeners();
    }
  }

  // ── Called when user taps Sign In ────────────────────────────────────
  // Returns null if login worked, or an error message string if it failed.
  Future<String?> login(String email, String password, String role) async {
    // Check if email exists in our test accounts
    final account = _testAccounts[email.trim().toLowerCase()];

    if (account == null) {
      return 'No account found with that email.';
    }

    if (account['password'] != password) {
      return 'Wrong password. Try again.';
    }

    if (account['role'] != role) {
      return 'Wrong role selected for this account.';
    }

    // Everything matched — save the login
    userName = account['name'];
    userRole = account['role'];

    // Write to phone storage so next app open skips login
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName!);
    await prefs.setString('userRole', userRole!);

    notifyListeners(); // tells all screens to rebuild
    return null; // null = success, no error
  }

  // ── Called when user taps Logout ─────────────────────────────────────
  Future<void> logout() async {
    userName = null;
    userRole = null;

    // Clear saved login from phone
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    notifyListeners();
  }

  // ── Called when user edits their name in profile ─────────────────────
  Future<void> updateName(String newName) async {
    userName = newName;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', newName);

    notifyListeners();
  }
}