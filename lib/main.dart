import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location bug',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            children: [
              TextButton(
                onPressed: Location().requestPermission,
                child: const Text("Request location Permission"),
              ),
              const Text("""Reproducation steps:
1. Click the "Request location Permission" button to request location permission
2. Select "Only this time" on the permission dialog
3. Put app in background for 60 seconds to allow the permission to expire
4. Return to app
"""),
            ],
          ),
        ),
      );
}
