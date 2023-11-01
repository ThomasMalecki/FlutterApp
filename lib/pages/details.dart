import 'package:flutter/material.dart';
import 'package:flutterapp/pages/scanned.dart';

class ScannedEquationDetailsPage extends StatelessWidget {
  final ScannedEquation equation;

  ScannedEquationDetailsPage(this.equation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          equation.name,
          style: TextStyle(color: Colors.black), // Tekstkleur van de titel
        ),
        elevation: 0, // Geen schaduw onder de app-balk
        backgroundColor: Colors.transparent, // Oranje achtergrondkleur
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  equation.details,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Datum:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      equation.date,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
