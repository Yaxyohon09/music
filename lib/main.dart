import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController input = TextEditingController();
  String matn = "";

  void save(qayt) async {
    setState(() {
      matn = input.text;
    });
    final saqla = await SharedPreferences.getInstance();
    await saqla.setString(
      "key",
      qayt,
    );
  }

  void yukla() async {
    final saqla2 = await SharedPreferences.getInstance();
    setState(() {
      matn = saqla2.getString("key") ?? "malumot saqlanmadi";
      input.text = matn;
    });
  }

  @override
  void initState() {
    super.initState();
    yukla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${matn}",
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        save(input.text);
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Container(
              height: 250,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: input,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          save(input.text);
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.check,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);                                                      
                        },
                        icon: Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
