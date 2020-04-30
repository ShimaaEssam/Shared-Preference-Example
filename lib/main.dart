import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SharedPreferenceDemo(),
    );
  }
}



class SharedPreferenceDemo extends StatefulWidget {
  SharedPreferenceDemo() : super();

  @override
  SharedPreferenceDemoState createState() => SharedPreferenceDemoState();
}

class SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  //
  String data = "";
  String nameKey = "_key_name";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    setData();
  }

  Future<bool> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();//static newobject from shared preference 34an a2dr access kol el data
    return await preferences.setString(nameKey, controller.text);//34an a3mlo mara wa7da bs
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  setData() {
    loadData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference Demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(hintText: "Enter Name"),
            ),
            OutlineButton(
              child: Text("SAVE NAME"),
              onPressed: () {
                saveData();
              },
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            OutlineButton(
              child: Text("LOAD NAME"),
              onPressed: () {
                setData();
              },
            ),
          ],
        ),
      ),
    );
  }
}