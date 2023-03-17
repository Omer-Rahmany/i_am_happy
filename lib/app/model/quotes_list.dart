import 'package:i_am_happy/app/model/quote.dart';

class QuotesList {
  final List<Quote> quotes;

  const QuotesList({
    required this.quotes,
  });

  factory QuotesList.fromJsonArray(List<dynamic> json) {
    // json.map((json) => Quote.fromJson(json))
    return QuotesList(
      quotes: json.map<Quote>((x) => Quote.fromJson(x)).toList(),
    );
  }
}
