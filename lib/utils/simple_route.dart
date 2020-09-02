import 'package:flutter/material.dart';

import 'package:tasmkt/views/home_screen.dart';
import 'package:tasmkt/views/password_screen.dart';
import 'package:tasmkt/views/kunjungan_screen.dart';
import 'package:tasmkt/views/kunjungan_new_screen.dart';
import 'package:tasmkt/views/kunjungan_rekap_screen.dart';

void simpleRoute(BuildContext context, name) {
  if (name == "Home") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  } else if (name == "Password") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PasswordScreen()));
  } else if (name == "Kunjungan") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => KunjunganScreen()));
  } else if (name == "Kunjungan New") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => KunjunganNewScreen()));
  } else if (name == "Kunjungan Rekap") {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => KunjunganRekapScreen()));
  }
}
