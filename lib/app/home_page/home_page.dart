import 'package:flutter/material.dart';
import 'package:i_am_happy/app/common_widgets/vertical_spacer.dart';
import 'package:i_am_happy/app/model/quotes_list.dart';

import '../services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  final AuthBase auth;

  const HomePage({
    super.key,
    required this.auth,
  });

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          TextButton(
            onPressed: _signOut,
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.black87),
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Sentence of the day"),
          ),
          VerticalSpacer(height: 20.0),
          Quote(),
        ],
      ),
    );
  }
}

class Quote extends StatefulWidget {
  const Quote({super.key});

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  QuotesList _quotesList = QuotesList(quotes: []);
  @override
  void initState() {
    super.initState();
    doFetchQuote();
  }

  Future<http.Response> fetchQuote() {
    final String _url = "https://type.fit/api/quotes";
    final Uri _uri = Uri.parse(_url);
    return http.get(_uri);
  }

  @override
  Widget build(BuildContext context) {
    return _quotesList.quotes.isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _quotesList.quotes.first.text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const VerticalSpacer(height: 20.0),
                Text(
                  "\"${_quotesList.quotes.first.author}\"",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
  }

  void doFetchQuote() async {
    final response = await fetchQuote();
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      setState(() {
        _quotesList = QuotesList.fromJsonArray(json.decode(response.body));
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    print(_quotesList);
  }
}
