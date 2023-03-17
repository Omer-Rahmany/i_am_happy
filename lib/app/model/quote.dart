import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Quote {
  final String id = uuid.v1();
  final String text;
  final String author;

  Quote({
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['text'],
      author: json['author'] ?? "",
    );
  }
}
