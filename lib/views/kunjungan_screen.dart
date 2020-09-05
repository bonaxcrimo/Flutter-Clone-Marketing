import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasmkt/configuration.dart';
import 'package:tasmkt/widgets/custom_appbar.dart';
import 'package:tasmkt/widgets/drawer_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:tasmkt/widgets/outline_text_view.dart';
import 'package:intl/intl.dart';

class KunjunganScreen extends StatefulWidget {
  KunjunganScreen({Key key}) : super(key: key);

  @override
  _KunjunganScreenScreenState createState() => _KunjunganScreenScreenState();
}

class _KunjunganScreenScreenState extends State<KunjunganScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _controller = new TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    // loadData();
    _controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    return Scaffold(
      appBar: CustomAppBar(title: "Kunjungan"),
      drawer: DrawerNavigation(),
      body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                      child: OutlineTextView(
                    controller: _controller,
                    hintText: "Pilih Tanggal",
                    borderColor: Colors.grey,
                    onTap: () {
                      _selectDate(context);
                    },
                  )),
                  SizedBox(width: 10),
                  RaisedButton(
                      padding: EdgeInsets.all(12.5),
                      child: Text(
                        "Filter",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        loadData(DateFormat('yyyy-MM-dd').format(selectedDate));
                      })
                ],
              ),
              Text("Good Girl")
            ],
          )),
    );
  }

  void loadData(String tgl) async {
    Map data = {"userid": "bonatua", "tgl": tgl};
    final response = await http.post(kunjunganUrl, body: data);
    final dataFinal = jsonDecode(response.body);
    print(dataFinal);
  }
}
