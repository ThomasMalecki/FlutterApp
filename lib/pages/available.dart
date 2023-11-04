import 'package:flutter/material.dart';
import 'package:flutterapp/apis/equations_api.dart';
import 'package:flutterapp/models/equations.dart';

class OverviewEquationsPage extends StatefulWidget {
  const OverviewEquationsPage({super.key});

  @override
  _OverviewEquationsPageState createState() => _OverviewEquationsPageState();
}

class _OverviewEquationsPageState extends State<OverviewEquationsPage> {
  List<Available> equations = [];
  int count = 0;

  @override
  void initState() {
    super.initState();
    _getAvailable();
  }

  void _getAvailable() {
    EquationsApi.fetchAvailable().then((result) {
      setState(() {
        equations = result;
        count = result.length;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Available equations",
          style: TextStyle(color: Colors.black), // Tekstkleur van de titel
        ),
        elevation: 0, // Geen schaduw onder de app-balk
        backgroundColor: Colors.transparent, // Oranje achtergrondkleur
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: _equationsItems(),
      ),
    );
  }

  ListView _equationsItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(equations[position].equation),
            ),
            title: Text(equations[position].equation),
            subtitle: Text(equations[position].solution),
            onTap: () {
              debugPrint("Tapped on ${equations[position].id}");
            },
          ),
        );
      },
    );
  }
}
