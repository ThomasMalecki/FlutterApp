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

        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(scanned[position].imagePath.toString()),
            ),
            title: Text(foundAvailable.equation),
            subtitle: Text(scanned[position].date),
            onTap: () {
              debugPrint("Tapped on ${scanned[position].id}");
            },
          ),
        );
      },
    );
  }
}
