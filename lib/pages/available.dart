
import 'package:flutter/material.dart';

class OverviewEquationsPage extends StatefulWidget {
  const OverviewEquationsPage({super.key});

  @override
  _OverviewEquationsPageState createState() => _OverviewEquationsPageState();
}

class _OverviewEquationsPageState extends State<OverviewEquationsPage> {
  List<String> equations = [
    'Vergelijking 1',
    'Vergelijking 2',
    'Vergelijking 3'
  ];

  TextEditingController _equationController = TextEditingController();
  bool _isEditing = false;
  int _editingIndex = -1;

  void _addEquation() {
    if (_isEditing) {
      equations[_editingIndex] = _equationController.text;
    } else {
      equations.add(_equationController.text);
    }
    _resetForm();
  }

  void _deleteEquation(int index) {
    setState(() {
      equations.removeAt(index);
    });
  }

  void _updateEquation(int index) {
    setState(() {
      _equationController.text = equations[index];
      _isEditing = true;
      _editingIndex = index;
    });
  }

  void _resetForm() {
    setState(() {
      _equationController.text = '';
      _isEditing = false;
      _editingIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Overview Equations",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20), // Tekstkleur van de titel
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: equations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(equations[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _updateEquation(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteEquation(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _equationController,
                    decoration: InputDecoration(
                      labelText: 'Nieuwe Vergelijking',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _addEquation();
                  },
                  child: Text(_isEditing ? 'Update' : 'Toevoegen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
