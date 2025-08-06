import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthcare/onbording_Screen.dart';
import 'package:healthcare/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Get SharedPreferences instance
  final prefs = await SharedPreferences.getInstance();
  
  // Use null-aware operator with default value
  final bool seenOnboarding = prefs.getBool('seen_onboarding') ?? false;
  
  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding; // Make this required
  
  const MyApp({
    super.key,
    required this.seenOnboarding, // Mark as required
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: seenOnboarding ? const HomePage() : const OnbordingScreen(),
    );
  }
}