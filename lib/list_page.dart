import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var transactionStatus = "N/A";
  var data = <dynamic>[];

  @override
  void initState() {
    super.initState();
    inquiryProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Page'),
        ),
        body: new Container(
          child: Center(child: getListView()),
        ));
  }

  getListView() {
    if (this.transactionStatus == "") {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Text(data[index]["title"].toString()),
                RaisedButton(
                  child: Text("info"),
                  onPressed: () {
                    showAlert(context, data[index]["id"].toString() + "-" + data[index]["title"]);
                  },
                ),
              ],
            ),
            height: 100.0,
            alignment: Alignment.center,
          );
        },
      );
    } else {
      return Text(transactionStatus);
    }
  }

  inquiryProgress() async {
    transactionStatus = "loading ...";
    setState(() {});
    var result = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    data = json.decode(result.body);
    transactionStatus = "";
    setState(() {});
  }

  static void showAlert(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                title: const Text("Info"),
                content: Text(content),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      // color: Colors.green,
                      padding: const EdgeInsets.all(14),
                      child: const Text("OK"),
                    ),
                  ),
                ]));
  }
}
