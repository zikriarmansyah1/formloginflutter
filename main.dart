import 'package:flutter/material.dart';

import 'beranda.dart';

class ColorPallete {
  static const PrymaryColor = Color(0xfffce4ec);
  static const PrymaryDarkColor = Color(0xffff80ab);
  static const UnderlineTextField = Color(0xfff44336);
  static const HintColor = Color(0xffff9800);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'MY Login App';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final String nama = "zikriarmansyah18@gmail", sandi = "armansyah";
  final namaController = TextEditingController();
  final sandiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //yang ini untuk nama
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(hintText: 'email'),
            validator: (value) {
              if (value.isEmpty) {
                return 'email  Anda  Valid, Masukkan email Anda Yang Benar';
              }
              return null;
            },
          ),
          //Yang ini untuk sandi
          TextFormField(
            controller: sandiController,
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Password Anda Salah, Masukkan password Anda Yang Benar ';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (namaController.text.trim() == nama &&
                    sandiController.text.trim() == sandi) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Maaf email Atau password Tidak Tersedia atau Valid'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
