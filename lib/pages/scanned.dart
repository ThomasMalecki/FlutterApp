import 'package:flutter/material.dart';
import 'package:flutterapp/pages/details.dart';

// Voorbeeldmodel van gescande vergelijkingen
class ScannedEquation {
  final String name;
  final String details;
  final String date;

  ScannedEquation(this.name, this.details, this.date);
}

// Voorbeeldlijst met gescande vergelijkingen
List<ScannedEquation> scannedEquations = [
  ScannedEquation(
      'Vergelijking 1', 'Uitleg over vergelijking 1...', '01-01-2023'),
  ScannedEquation(
      'Vergelijking 2', 'Uitleg over vergelijking 2...', '02-01-2023'),
  ScannedEquation(
      'Vergelijking 3', 'Uitleg over vergelijking 3...', '03-01-2023'),
  // Voeg hier meer gescande vergelijkingen toe
];

class ScannedEquationsPage extends StatelessWidget {
  const ScannedEquationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gescande Vergelijkingen",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20), // Tekstkleur van de titel
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: scannedEquations.map((equation) {
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 4,
            child: ListTile(
              title: Text(equation.name),
              subtitle: Text(equation.date),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScannedEquationDetailsPage(equation),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
