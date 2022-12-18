import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ocean/tickers/models.dart';

import 'constants.dart';
import 'error.dart';

String Function(String exchange) tickerEndpoint = (exchange) =>
    'https://api.polygon.io/v3/reference/tickers?limit=1000&exchange=$exchange&market=stocks&active=true&sort=ticker&order=asc&apiKey=${Constants.polygonApiKey}';

enum ISOExchanges { nyse, nasdaq }

var exchangeCode = {ISOExchanges.nyse: 'XNYS', ISOExchanges.nasdaq: 'XNAS'};

class Ticker {
  final String ticker;
  final String name;
  final String exchange;

  Ticker(this.ticker, this.name, this.exchange);
}

class API {
  static Future<List<Ticker>> fetchTickers() async {
    var apiUrl = Uri.parse(tickerEndpoint(exchangeCode[ISOExchanges.nyse]!));
    debugPrint(apiUrl.toString());
    var currentPage =
        _returnResponse<PolygonTickerAPIResponse>(await http.get(apiUrl));
    return (currentPage.results ?? [])
        .map((e) => Ticker(e.ticker, e.name, e.primaryExchange))
        .toList();
  }
}

T _returnResponse<T>(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var decoded = json.decode(response.body.toString());
      return decoded as T;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorizedException(response.body.toString());
    case 500:
      throw ServerError(response.body.toString());
    default:
      throw FetchDataException(
          "Error occurred while communicating with server with StatusCode: ${response.statusCode}");
  }
}
