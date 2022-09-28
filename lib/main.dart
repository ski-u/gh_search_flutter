import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search GitHub Repository',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Search GitHub Repository'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _repos = <dynamic>[];

  Future<void> _fetchRepos() async {
    const url = 'https://api.github.com/search/repositories?q=flutter';
    final response = await http.get(Uri.parse(url));

    setState(() {
      _repos = json.decode(response.body)['items'] as List;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _repos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_repos[index]['full_name']}'),
          );
        },
      ),
    );
  }
}
