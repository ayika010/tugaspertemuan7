import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/screens/Home/addscreen.dart';
import 'package:flutter_application_1/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/models/boxes.dart';
import 'package:flutter_application_1/models/keranjang.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Keranjang>(HiveBoxex.keranjang).listenable(),
        builder: (context, Box<Keranjang> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text('Keranjang listing is Empty'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Keranjang? res = box.getAt(index);
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: UniqueKey(),
                onDismissed: (direction) {
                  res!.delete();
                },
                child: ListTile(
                  title: Text(res!.title),
                  subtitle: Text(res.description),
                ),
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('LogOut'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Keranjang',
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddKeranjangScreen(),
              ))
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
