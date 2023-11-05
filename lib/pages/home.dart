import 'package:flutter/material.dart';
import 'package:flutterapp/pages/scanned.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welkom bij de VergelijkingsApp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scan en Beheer Vergelijkingen!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Deze app stelt je in staat om wiskundige vergelijkingen te scannen met behulp van de camera. Je kunt vervolgens de gescande vergelijkingen bekijken, beheren en gedetailleerde informatie ervan verkrijgen.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 60,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Scan Vergelijkingen',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Gebruik de camera om\nvergelijkingen te scannen',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.search,
                      size: 60,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bekijk Vergelijkingen',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Bekijk gescande\nvergelijkingen',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScannedEquationsPage(),
                  ),
                );
              },
              child: Text('Bekijk Gescande Vergelijkingen'),
            ),
          ],
        ),
      ),
    );
  }
}
