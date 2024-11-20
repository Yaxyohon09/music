// // import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';
// // import 'package:video_player/video_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Sahifa1(),
//   ));
// }

// class Sahifa1 extends StatefulWidget {
//   const Sahifa1({super.key});

//   @override
//   State<Sahifa1> createState() => _Sahifa1State();
// }

// class _Sahifa1State extends State<Sahifa1> {
//   String name = "";
//   String localtime = "";
//   String temp_c = "";
//   String condition = "";
//   String icon = "";
//   void apiurl() async {
//     String apilink =
//         "https://api.weatherapi.com/v1/forecast.json?key=40b2851af21546fbbd294943232312&q=kokand&days=2&aqi=yes&alerts=yes";
//     Response qabul = await get(
//       Uri.parse(
//         apilink,
//       ),
//     );
//     Map alohida = jsonDecode(
//       qabul.body,
//     );
//     setState(
//       () {
//         name = alohida['location']['name'];
//         // localtime = alohida['location']['localtime_epoch'];
//         // temp_c = alohida['location']['temp_c'];
//         // condition = alohida['location']['condition']['text'];
//         // icon = alohida['location']['condition']['icon'];
//       },
//     );
//     Future.delayed(
//       Duration(
//         seconds: 1,
//       ),
//       apiurl,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               name,
//             ),
//             Text(
//               localtime,
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         // mainAxisAlignment: ,
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: 30,
//               ),
//               CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.black,
//                 child: Text(
//                   temp_c,
//                 ),
//               ),
//               SizedBox(
//                 width: 100,
//               ),
//               Container(
//                 height: 180,
//                 width: 250,
//                 color: Colors.black,
//                 child: Column(
//                   children: [
//                     Text(
//                       condition,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       icon,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sahifa1(),
  ));
}

class Sahifa1 extends StatefulWidget {
  const Sahifa1({super.key});

  @override
  State<Sahifa1> createState() => _Sahifa1State();
}

class _Sahifa1State extends State<Sahifa1> {
  String name = "";
  String localtime = "";
  String temp_c = "";
  String condition = "";
  String icon = "";

  void apiurl() async {
    try {
      String apilink =
          "https://api.weatherapi.com/v1/forecast.json?key=40b2851af21546fbbd294943232312&q=kokand&days=2&aqi=yes&alerts=yes";
      Response qabul = await get(Uri.parse(apilink));
      Map alohida = jsonDecode(qabul.body);

      setState(() {
        name = alohida['location']['name'];
        localtime = alohida['location']['localtime'];
        temp_c = alohida['current']['temp_c'].toString();
        condition = alohida['current']['condition']['text'];
        icon = alohida['current']['condition']['icon'];
      });
    } catch (e) {
      print("Xato yuz berdi: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    apiurl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
            ),
            Text(
              localtime,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Text(
                    temp_c,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Condition: $condition",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        icon.isNotEmpty
                            ? Image.network(
                                "https:$icon",
                                height: 50,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              icon,
            ),
            Container(
              height: 1,
              width: 1000,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
