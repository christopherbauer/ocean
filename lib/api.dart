import 'package:http/http.dart' as http;

String Function() getPolygonAPIKey = () => "oei5e0up1fRaKmRKxKwLEswoQTrwnytZ";
String Function(String exchange) tickerEndpoint = (exchange) =>
    'https://api.polygon.io/v3/reference/tickers?limit=1000&exchange=$exchange&market=stocks&active=true&sort=ticker&order=asc&apiKey=${getPolygonAPIKey()}';

enum ISOExchanges { nyse, nasdaq }

var exchangeCode = {ISOExchanges.nyse: 'xnys', ISOExchanges.nasdaq: 'xnas'};

Future<http.Response> fetchTickers() {
  return http.get(Uri.parse(tickerEndpoint(exchangeCode[ISOExchanges.nyse])));
}
