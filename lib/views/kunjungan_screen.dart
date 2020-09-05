import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasmkt/configuration.dart';
import 'package:tasmkt/models/MKunjugan.dart';
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
  Future<List<MKunjungan>> kunjungan;

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
  void initState() {
    super.initState();
    kunjungan = loadData("2020-09-04");
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
                        setState(() {
                          kunjungan = loadData(
                              DateFormat('yyyy-MM-dd').format(selectedDate));
                        });
                      })
                ],
              ),
              Expanded(
                child: FutureBuilder<List<MKunjungan>>(
                  future: kunjungan,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? PhotosList(photos: snapshot.data)
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          )),
    );
  }

  Future<List<MKunjungan>> loadData(String tgl) async {
    setState(() {});
    Map data = {"userid": "bonatua", "tgl": tgl};

    final response = await http.post(kunjunganUrl, body: data);
    // Use the compute function to run parsePhotos in a separate isolate.

    return compute(parseKunjungan, response.body);
  }

  void loadData2(String tgl) async {
    Map data = {"userid": "bonatua", "tgl": tgl};
    final response = await http.post(kunjunganUrl, body: data);
    final dataFinal = jsonDecode(response.body)['data'];
  }
}

List<MKunjungan> parseKunjungan(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed.map<MKunjungan>((json) => MKunjungan.fromJson(json)).toList();
}

class PhotosList extends StatelessWidget {
  final List<MKunjungan> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Text(photos[index].fNShipper);
      },
    );
  }
}
