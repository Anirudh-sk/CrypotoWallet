import 'package:app/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "Bitcoin",
    "Tether",
    "Ethereum",
  ];

  String dropdownValue = "Bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Coins"),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                dropdownColor: Colors.lightBlueAccent,
                focusColor: Colors.lightBlueAccent,
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value.toString();
                  });
                },
                items: coins.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  );
                }).toList(),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.blueAccent),
                  controller: _amountController,
                  decoration: InputDecoration(
                      labelText: "Number Of Coins",
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      fillColor: Colors.blueAccent),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueAccent,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    await addCoin(dropdownValue, _amountController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ));
  }
}
