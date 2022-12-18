//Holy fuck... this much code to serialize from json?????
//https://javiercbk.github.io/json_to_dart/

class PolygonTickerAPIResponse {
  List<TickerResults>? results;
  String? status;
  String? requestId;
  int? count;
  String? nextUrl;

  PolygonTickerAPIResponse(
      {this.results, this.status, this.requestId, this.count, this.nextUrl});

  PolygonTickerAPIResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <TickerResults>[];
      json['results'].forEach((v) {
        results!.add(TickerResults.fromJson(v));
      });
    }
    status = json['status'];
    requestId = json['request_id'];
    count = json['count'];
    nextUrl = json['next_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['request_id'] = requestId;
    data['count'] = count;
    data['next_url'] = nextUrl;
    return data;
  }
}

class TickerResults {
  String ticker = "";
  String name = "";
  String? market;
  String? locale;
  String primaryExchange = "";
  String? type;
  bool? active;
  String? currencyName;
  String? cik;
  String? compositeFigi;
  String? shareClassFigi;
  String? lastUpdatedUtc;

  TickerResults(
      {required this.ticker,
      required this.name,
      this.market,
      this.locale,
      required this.primaryExchange,
      this.type,
      this.active,
      this.currencyName,
      this.cik,
      this.compositeFigi,
      this.shareClassFigi,
      this.lastUpdatedUtc});

  TickerResults.fromJson(Map<String, dynamic> json) {
    ticker = json['ticker'];
    name = json['name'];
    market = json['market'];
    locale = json['locale'];
    primaryExchange = json['primary_exchange'];
    type = json['type'];
    active = json['active'];
    currencyName = json['currency_name'];
    cik = json['cik'];
    compositeFigi = json['composite_figi'];
    shareClassFigi = json['share_class_figi'];
    lastUpdatedUtc = json['last_updated_utc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticker'] = ticker;
    data['name'] = name;
    data['market'] = market;
    data['locale'] = locale;
    data['primary_exchange'] = primaryExchange;
    data['type'] = type;
    data['active'] = active;
    data['currency_name'] = currencyName;
    data['cik'] = cik;
    data['composite_figi'] = compositeFigi;
    data['share_class_figi'] = shareClassFigi;
    data['last_updated_utc'] = lastUpdatedUtc;
    return data;
  }
}
