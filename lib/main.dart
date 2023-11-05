library sweet_nav_bar;

import 'package:flutter/material.dart';
import 'package:flutterapp/pages/available.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/scanned.dart';

import './widgets/sweet_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SweetNavBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SweetNaveBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SweetNaveBar extends StatefulWidget {
  const SweetNaveBar({Key? key}) : super(key: key);

  @override
  State<SweetNaveBar> createState() => _SweetNavBarState();
}

class _SweetNavBarState extends State<SweetNaveBar> {
  final List<Widget> _items = [
    const HomeScreenPage(),
    const ScannedEquationsPage(),
    const OverviewEquationsPage(),
  ];

  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: _items[cIndex])),
      bottomNavigationBar: SweetNavBar(
        currentIndex: cIndex,
        paddingBackgroundColor: Colors.transparent,
        items: [
          SweetNavBarItem(
              sweetActive: const Icon(Icons.home),
              sweetIcon: const Icon(
                Icons.home_outlined,
              ),
              sweetLabel: 'Home',
              sweetBackground: Colors.red),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.list_alt),
              sweetLabel: 'Scanned Equations'),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.qr_code),
              sweetLabel: 'Overview Equations'),
        ],
        onTap: (index) {
          setState(() {
            cIndex = index;
          });
        },
      ),
    );
  }
}
