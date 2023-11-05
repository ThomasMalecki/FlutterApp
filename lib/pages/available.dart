import 'package:flutter/material.dart';
import 'package:flutterapp/apis/equations_api.dart';
import 'package:flutterapp/models/equations.dart';

class OverviewEquationsPage extends StatefulWidget {
  const OverviewEquationsPage({super.key});

  @override
  _OverviewEquationsPageState createState() => _OverviewEquationsPageState();
}

class _OverviewEquationsPageState extends State<OverviewEquationsPage> {
  List<Available> available = [];
  int count_available = 0;

  @override
  void initState() {
    super.initState();
    _getAvailable();
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
          "Available equations",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: _equationsItems(),
            ),
          ),
        ],
      ),
    );
  }

  ListView _equationsItems() {
    return ListView.builder(
      itemCount: count_available,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(available[position].equation),
            ),
            title: Text(available[position].equation),
            subtitle: Text(available[position].solution),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editEquation(available[position]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteEquation(available[position]);
                  },
                ),
              ],
            ),
            onTap: () {
              _viewEquationDetails(available[position]);
            },
          ),
        );
      },
    );
  }

  void _editEquation(Available equation) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                'Edit Equation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add form fields or content to edit the equation
              // For example:
              const SizedBox(height: 20),
              TextFormField(
                initialValue: equation.equation,
                decoration: const InputDecoration(
                  labelText: 'Equation',
                  labelStyle:
                      TextStyle(color: Colors.orange), // Oranje labelkleur
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                cursorColor: Colors.orange, // Oranje cursorkleur
                onChanged: (value) {
                  // Update equation details
                  equation.equation = value;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: equation.solution,
                decoration: const InputDecoration(
                  labelText: 'Solution',
                  labelStyle:
                      TextStyle(color: Colors.orange), // Oranje labelkleur
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                cursorColor: Colors.orange, // Oranje cursorkleur
                onChanged: (value) {
                  // Update solution details
                  equation.solution = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to save the edited equation
                  // Implement here the logic to save changes to the equation
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Pas de waarde naar wens aan
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteEquation(Available equation) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                'Delete Equation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Are you sure you want to delete this equation?'),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Logic to save the edited equation
                      // Implement here the logic to save changes to the equation
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 223, 119, 119)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Pas de waarde naar wens aan
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _viewEquationDetails(Available equation) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                'Equation Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Equation: ${equation.equation}'),
              Text('Solution: ${equation.solution}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to save the edited equation
                  // Implement here the logic to save changes to the equation
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Pas de waarde naar wens aan
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
