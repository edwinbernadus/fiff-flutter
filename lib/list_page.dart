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
      // hint_show_webservice_result_on_list    
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Text(data[index]["title"].toString()),
                //hint_button_on_list
                RaisedButton(
                  child: Text("info"),
                  onPressed: () {
                    // hint_show_detail_item_on_alert
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
    // hint_show_loading_indicator
    transactionStatus = "loading ...";
    setState(() {});
    // hint_loading_webservice
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
