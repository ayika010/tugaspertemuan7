import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/models/boxes.dart';
import 'package:flutter_application_1/models/keranjang.dart';

class AddKeranjangScreen extends StatefulWidget {
  AddKeranjangScreen({Key? key}) : super(key: key);
  @override
  _AddKeranjangScreenState createState() => _AddKeranjangScreenState();
}

class _AddKeranjangScreenState extends State<AddKeranjangScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFormSubmit();
      print("Form Validated");
    } else {
      print("Form not validated");
      return;
    }
  }

  late String title;
  late String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Keranjang'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Title'),
                      validator: (String? value) {
                        if (value == null || value.trim().length == 0) {
                          return "Required";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        title = value;
                      }),
                  TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Description'),
                      validator: (String? value) {
                        if (value == null || value.trim().length == 0) {
                          return "Required";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        description = value;
                      }),
                  ElevatedButton(
                      onPressed: () {
                        validated();
                      },
                      child: Text('Add Keranjang'))
                ],
              ),
            )),
      ),
    );
  }

  void _onFormSubmit() {
    Box<Keranjang> keranjangBox = Hive.box<Keranjang>(HiveBoxex.keranjang);
    keranjangBox.add(Keranjang(title: title, description: description));
    Navigator.of(context).pop();
    print(keranjangBox);
  }
}
