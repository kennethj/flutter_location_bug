import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) => MaterialApp(title: 'Location bug', theme: ThemeData(), home: const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
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
              const Text("""Reproduction steps:

1. Click the "Request location Permission" button to request location permission
2. Select "Only this time" on the permission dialog
3. Put the app in the background for 60 seconds to allow the permission to expire
4. Return to app
"""),
            ],
          ),
        ),
      );
}
