import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NPL Demo Dictionery',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Novelops Supply Chain Dictionery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = [
    'A (Nationality symbol for Australia)',
    'AA (Automobile Association)',
    'AAIB (Air Accidents Investigation Branch)',
    'ABC (Activity Based Costing)',
    'B (National Symbol for Belgium)',
    'B2B (Buisness to Business)',
    'B2C (Business To Customer)',
    'BA (British Airways)',
    'C&U (Construction & Use)',
    'CAA (Civil Aviation Authority)',
    'CAB (Citizen,s Advices Bureau)',
    'CAF (Currency Adjustment Factor)',
    'D (Nationality symbol for Germony)',
    'D/A (Deposit/Account)',
    'DAM (Drivers Action Movement)',
    'DC (Distribution Center)',
  ];
  Future searchData(String param) async {
    List<String> result =
        data.where((element) => element.contains(param)).toList();
    return result;
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              tileColor: Colors.yellow,
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
              ),
              tileColor: Colors.green,
              title: const Text('SearchWord'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.web,
              ),
              tileColor: Colors.yellow,
              title: const Text('Novelops Web'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
              ),
              tileColor: Color.fromARGB(255, 6, 134, 27),
              title: const Text('Privacy & Policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(border: OutlineInputBorder())),
              suggestionsCallback: (pattern) async {
                return await searchData(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                print(suggestion);
              },
            )
          ],
        ),
      ),
    );
  }
}
