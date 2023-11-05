import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutterapp/apis/equations_api.dart';
import 'package:flutterapp/models/equations.dart';
import 'package:flutterapp/models/scanned.dart';

class ScannedEquationsPage extends StatefulWidget {
  const ScannedEquationsPage({super.key});

  @override
  _ScannedEquationsPageState createState() => _ScannedEquationsPageState();
}

class _ScannedEquationsPageState extends State<ScannedEquationsPage> {
  List<Scanned> scanned = [];
  int count = 0;
  List<Available> available = [];
  int count_available = 0;

  @override
  void initState() {
    super.initState();
    _getScanned();
    _getAvailable();
  }

  void _getScanned() {
    EquationsApi.fetchScanned().then((result) {
      setState(() {
        scanned = result;
        count = result.length;
      });
    });
  }

  void _getAvailable() {
    EquationsApi.fetchAvailable().then((result) {
      setState(() {
        available = result;
        count_available = result.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scanned Equations",
          style: TextStyle(color: Colors.black), // Tekstkleur van de titel
        ),
        elevation: 0, // Geen schaduw onder de app-balk
        backgroundColor: Colors.transparent, // Oranje achtergrondkleur
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: _equationsItems(available),
      ),
    );
  }

  ListView _equationsItems(List<Available> available) {
    return ListView.builder(
      itemCount: scanned.length,
      itemBuilder: (BuildContext context, int position) {
        final foundAvailable = available.firstWhere(
          (available) => available.id == scanned[position].available_id,
          orElse: () =>
              Available(id: 0, equation: '', solution: '', explanation: ''),
        );
        return SizedBox(
          height: 200.0, // Hier kun je de gewenste hoogte instellen
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(scanned[position]
                      .imagePath
                      .toString()), // Vervang 'assets/achtergrond_afbeelding.jpg' met het pad naar jouw afbeelding
                  fit: BoxFit.cover,
                ),
                color: Colors.black.withOpacity(0.5),
              ),
              child: ListTile(
                title: Text(
                  foundAvailable.equation,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  scanned[position].date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  final clickedAvailable = available.firstWhere(
                    (available) =>
                        available.id == scanned[position].available_id,
                    orElse: () => Available(
                        id: 0, equation: '', solution: '', explanation: ''),
                  );
                  double screenHeight = MediaQuery.of(context).size.height;
                  double modalHeight = screenHeight *
                      0.93; // Hoogte van het modale venster is 90% van de schermhoogte
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        height: modalHeight,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Sluiten',
                                    style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: ListView(
                                children: [
                                  const Text(
                                    "Equation solved",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Solved on: ${scanned[position].date}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        scanned[position].imagePath.toString(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      "${clickedAvailable.equation} = ${clickedAvailable.solution}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
