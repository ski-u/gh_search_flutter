import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gh_search_flutter/model/repo.dart';
import 'package:gh_search_flutter/ui/repository_row.dart';
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
  Timer? _debounce;
  final _queryController = TextEditingController();
  var _repos = <Repo>[];

  void _onQueryChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _fetchRepos(query);
    });
  }

  Future<void> _fetchRepos(String query) async {
    final url = 'https://api.github.com/search/repositories?q=$query';
    final response = await http.get(Uri.parse(url));

    setState(() {
      _repos = List<Repo>.from(json.decode(response.body)['items'].map((data) {
        return Repo.fromJson(data);
      }));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextField(
              controller: _queryController,
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _onQueryChanged,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _repos.length,
              itemBuilder: (BuildContext context, int index) {
                return RepoRow(repo: _repos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
