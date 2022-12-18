import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Ticker> items = [];
  Future<void> doSomething() async {
    var tickers = await API.fetchTickers();
    setState(() {
      items = tickers;
    });
  }

  @override
  void initState() {
    doSomething();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: TextField(
            decoration: InputDecoration(
          hintText: "search for a ticker",
          hintStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontStyle: FontStyle.italic),
        )),
      ),
      ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return ListTile(title: Text(items[index].name));
        }),
      )
    ]));
  }
}
