import 'package:flutter/material.dart';
import 'dart:async';
import 'package:weather_app/Pages/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        // Set the primary color to your desired color
        primaryColor: Colors.blue,
        // Set the color of the Radio widget
        unselectedWidgetColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> _quotes = const [
    'Get current weather and forecast quickly.',
    'Plan your day with live conditions.',
    'Stay ahead of rain, wind, and heat.',
    'Your local forecast at a glance.',
  ];

  String _typedQuote = '';
  int _quoteIndex = 0;
  bool _shouldStopTyping = false;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _startTypewriterLoop();
    _navigationTimer = Timer(const Duration(seconds: 10), () {
      if (!mounted) return;
      _shouldStopTyping = true;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  Future<void> _startTypewriterLoop() async {
    while (mounted && !_shouldStopTyping) {
      final String quote = _quotes[_quoteIndex];

      for (int i = 1; i <= quote.length; i++) {
        if (!mounted || _shouldStopTyping) return;
        setState(() {
          _typedQuote = quote.substring(0, i);
        });
        await Future.delayed(const Duration(milliseconds: 55));
      }

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted || _shouldStopTyping) return;

      setState(() {
        _typedQuote = '';
        _quoteIndex = (_quoteIndex + 1) % _quotes.length;
      });
    }
  }

  @override
  void dispose() {
    _shouldStopTyping = true;
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 61, 15, 1),
              Color.fromARGB(244, 182, 100, 6),
              Color.fromARGB(255, 6, 105, 105),
              Color.fromARGB(255, 4, 6, 119),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud, color: Colors.white, size: 72),
              const SizedBox(height: 16),
              const Text(
                'Olympus Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '"$_typedQuote"',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}