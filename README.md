# First Interfaction Frontend Framework (FIFF) - Flutter

## Getting Started
https://github.com/edwinbernadus/first-interaction-frontend-framework


## Snippet List
- hint_create_button
````dart
// hint_create_button
RaisedButton(
    child: Text("go to next page"),
    onPressed: () {
        print("input something here");
    },
),
````
- hint_open_new_page
````dart
// hint_open_new_page
Navigator.push(context,
    MaterialPageRoute(builder: (context) => ListPage()));
````
- hint_loading_webservice
````dart
// hint_loading_webservice
var result = await http
    .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
````
- hint_show_loading_indicator
````dart
// hint_show_loading_indicator
transactionStatus = "loading ...";
setState(() {});
````
- hint_show_webservice_result_on_list
````dart
// hint_show_webservice_result_on_list
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
````
- hint_button_on_list
````dart
//hint_button_on_list
RaisedButton(
    child: Text("info"),
    onPressed: () {
        showAlert(context, data[index]["id"].toString() + "-" + data[index]["title"]);
    },
),
````
- hint_show_detail_item_on_alert
````dart
// hint_show_detail_item_on_alert
showAlert(context, data[index]["id"].toString() + "-" + data[index]["title"]);
````