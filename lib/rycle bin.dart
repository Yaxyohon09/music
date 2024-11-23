// // // // // import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';
// // // // // import 'package:video_player/video_player.dart';
// // // // import 'package:flutter/cupertino.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart';
// // // // import 'dart:convert';

// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     debugShowCheckedModeBanner: false,
// // // //     home: Sahifa1(),
// // // //   ));
// // // // }

// // // // class Sahifa1 extends StatefulWidget {
// // // //   const Sahifa1({super.key});

// // // //   @override
// // // //   State<Sahifa1> createState() => _Sahifa1State();
// // // // }

// // // // class _Sahifa1State extends State<Sahifa1> {
// // // //   String name = "";
// // // //   String localtime = "";
// // // //   String temp_c = "";
// // // //   String condition = "";
// // // //   String code = "";
// // // //   void apiurl() async {
// // // //     String apilink =
// // // //         "https://api.weatherapi.com/v1/forecast.json?key=40b2851af21546fbbd294943232312&q=kokand&days=2&aqi=yes&alerts=yes";
// // // //     Response qabul = await get(
// // // //       Uri.parse(
// // // //         apilink,
// // // //       ),
// // // //     );
// // // //     Map alohida = jsonDecode(
// // // //       qabul.body,
// // // //     );
// // // //     setState(
// // // //       () {
// // // //         name = alohida['location']['name'];
// // // //         // localtime = alohida['location']['localtime_epoch'];
// // // //         // temp_c = alohida['location']['temp_c'];
// // // //         // condition = alohida['location']['condition']['text'];
// // // //         // code = alohida['location']['condition']['code'];
// // // //       },
// // // //     );
// // // //     Future.delayed(
// // // //       Duration(
// // // //         seconds: 1,
// // // //       ),
// // // //       apiurl,
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Row(
// // // //           children: [
// // // //             Text(
// // // //               name,
// // // //             ),
// // // //             Text(
// // // //               localtime,
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       body: Column(
// // // //         // mainAxisAlignment: ,
// // // //         children: [
// // // //           Row(
// // // //             children: [
// // // //               SizedBox(
// // // //                 width: 30,
// // // //               ),
// // // //               CircleAvatar(
// // // //                 radius: 50,
// // // //                 backgroundColor: Colors.black,
// // // //                 child: Text(
// // // //                   temp_c,
// // // //                 ),
// // // //               ),
// // // //               SizedBox(
// // // //                 width: 100,
// // // //               ),
// // // //               Container(
// // // //                 height: 180,
// // // //                 width: 250,
// // // //                 color: Colors.black,
// // // //                 child: Column(
// // // //                   children: [
// // // //                     Text(
// // // //                       condition,
// // // //                       style: TextStyle(
// // // //                         color: Colors.white,
// // // //                       ),
// // // //                     ),
// // // //                     Text(
// // // //                       code,
// // // //                       style: TextStyle(
// // // //                         color: Colors.white,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // import 'package:assets_audio_player/assets_audio_player.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';

// // // void main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   await AndroidAlarmManager.initialize();
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       title: 'API Alarm App',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: AlarmPage(),
// // //     );
// // //   }
// // // }

// // // class AlarmPage extends StatefulWidget {
// // //   @override
// // //   _AlarmPageState createState() => _AlarmPageState();
// // // }

// // // class _AlarmPageState extends State<AlarmPage> {
// // //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// // //       FlutterLocalNotificationsPlugin();
// // //   AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
// // //   TimeOfDay? selectedTime;
// // //   BuildContext? globalContext;

// // //   final String apiUrl = 'https://your-api-url.com'; // Replace with your API URL

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     initializeNotifications();
// // //   }

// // //   void initializeNotifications() {
// // //     const AndroidInitializationSettings initializationSettingsAndroid =
// // //         AndroidInitializationSettings('app_icon');

// // //     const InitializationSettings initializationSettings =
// // //         InitializationSettings(android: initializationSettingsAndroid);

// // //     flutterLocalNotificationsPlugin.initialize(initializationSettings);
// // //   }

// // //   Future<void> setAlarmOnServer(int hour, int minute) async {
// // //     final response = await http.post(
// // //       Uri.parse('$apiUrl/setAlarm'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({'hour': hour, 'minute': minute}),
// // //     );

// // //     if (response.statusCode == 200) {
// // //       print('Alarm set on server');
// // //     } else {
// // //       print('Failed to set alarm on server');
// // //     }
// // //   }

// // //   Future<void> scheduleAlarm(int hour, int minute) async {
// // //     final DateTime now = DateTime.now();
// // //     final DateTime scheduledTime = DateTime(
// // //       now.year,
// // //       now.month,
// // //       now.day,
// // //       hour,
// // //       minute,
// // //     );

// // //     await AndroidAlarmManager.oneShotAt(
// // //       scheduledTime,
// // //       0,
// // //       alarmCallback,
// // //       exact: true,
// // //       wakeup: true,
// // //     );

// // //     // Set the alarm on the server
// // //     await setAlarmOnServer(hour, minute);

// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text('Alarm set for ${selectedTime!.format(context)}'),
// // //       ),
// // //     );
// // //   }

// // //   static Future<void> alarmCallback() async {
// // //     final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
// // //     audioPlayer.open(
// // //       Audio("assets/alarm_sound.mp3"),
// // //       loopMode: LoopMode.single,
// // //       autoStart: true,
// // //     );

// // //     showDialog(
// // //       context: globalContext!,
// // //       barrierDismissible: false,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Alarm'),
// // //           content: Text('The alarm is ringing!'),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () {
// // //                 audioPlayer.stop();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Stop'),
// // //             ),
// // //             TextButton(
// // //               onPressed: () {
// // //                 audioPlayer.stop();
// // //                 Navigator.of(context).pop();
// // //                 // Schedule snooze for 5 minutes later
// // //                 final now = DateTime.now();
// // //                 AndroidAlarmManager.oneShotAt(
// // //                   now.add(Duration(minutes: 5)),
// // //                   1,
// // //                   alarmCallback,
// // //                   exact: true,
// // //                   wakeup: true,
// // //                 );
// // //               },
// // //               child: Text('Snooze'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   void setAlarm() async {
// // //     selectedTime = await showTimePicker(
// // //       context: context,
// // //       initialTime: TimeOfDay.now(),
// // //     );

// // //     if (selectedTime != null) {
// // //       scheduleAlarm(selectedTime!.hour, selectedTime!.minute);
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     globalContext = context;
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('API Alarm App'),
// // //         centerTitle: true,
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             ElevatedButton(
// // //               onPressed: setAlarm,
// // //               child: Text('Set Alarm'),
// // //             ),
// // //             if (selectedTime != null)
// // //               Text(
// // //                 'Alarm set for: ${selectedTime!.format(context)}',
// // //                 style: TextStyle(fontSize: 20),
// // //               ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';

// // void main() {
// //   runApp(
// //     MaterialApp(
// //       home: NomPage(),
// //     ),
// //   );
// // }

// // class NomPage extends StatefulWidget {
// //   const NomPage({super.key});

// //   @override
// //   State<NomPage> createState() => NomPageState();
// // }

// // class NomPageState extends State<NomPage> {
// //   final audioplayer = AudioPlayer();
// //   bool isPlaying = false;
// //   Duration duration = Duration.zero;
// //   Duration position = Duration.zero;
// //   int currentIndex = 0; // Current song index
// //   bool showSongList = false; // Toggle visibility of song list
// //   bool repeatOne = false; // Toggle repeat mode for a single song
// //   bool repeatAll = false; // Toggle repeat mode for all songs

// //   // List of songs
// //   List<A> nom = [
// //     A(
// //       name: "Нежно",
// //       photo: "image/rasm1.jpg",
// //       music: "speed.mp3",
// //     ),
// //     A(
// //       name: "Memories",
// //       photo: "image/rasm2.jpg",
// //       music: "Memories.mp3",
// //     ),
// //     A(
// //       name: "Life Letters",
// //       photo: "image/rasm3.jpg",
// //       music: "Life Letters.mp3",
// //     ),
// //     A(
// //       name: "All of the girls you loved before",
// //       photo: "image/rasm4.jpg",
// //       music: "All of the girls you loved before.mp3",
// //     ),
// //     A(
// //       name: "Pa Papy",
// //       photo: "image/rasm5.jpg",
// //       music: "PaPapy.mp3",
// //     ),
// //     A(
// //       name: "По шекам слёзи",
// //       photo: "image/rasm6.jpg",
// //       music: "poshekamslozi.mp3",
// //     ),
// //     A(
// //       name: "SI Ai",
// //       photo: "image/rasm7.jpg",
// //       music: "SI Ai .mp3",
// //     ),
// //     A(
// //       name: "Нежно",
// //       photo: "image/rasm8.jpg",
// //       music: "speed.mp3",
// //     ),
// //     A(
// //       name: "Моя пленница _ slowed",
// //       photo: "image/rasm0.jpg",
// //       music: "Моя пленница _ slowed.mp3",
// //     ),
// //     A(
// //       name: "Убегая от судьбы",
// //       photo: "image/rasm11.jpg",
// //       music: "Убегая от судьбы.mp3",
// //     ),
// //     A(
// //       name: "hood baby 8d",
// //       photo: "image/photo_2024-09-20_22-16-40.jpg",
// //       music: "hood baby 8d.mp3",
// //     ),
// //     A(
// //       name: "chikiri bang bang",
// //       photo: "image/rasm12.jpg",
// //       music: "chikiri bang bang.mp3",
// //     ),
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Load audio file duration
// //     audioplayer.onDurationChanged.listen((newDuration) {
// //       setState(() {
// //         duration = newDuration;
// //       });
// //     });

// //     // Update slider position as audio plays
// //     audioplayer.onPositionChanged.listen((newPosition) {
// //       setState(() {
// //         position = newPosition;
// //       });
// //     });

// //     // Detect when playback finishes
// //     audioplayer.onPlayerComplete.listen((_) {
// //       if (repeatOne) {
// //         // Repeat the current song
// //         playSong();
// //       } else if (repeatAll && currentIndex == nom.length - 1) {
// //         // If it's the last song and repeat all is on, go to the first song
// //         currentIndex = 0;
// //         playSong();
// //       } else if (currentIndex < nom.length - 1) {
// //         // Move to the next song
// //         skipToNext();
// //       } else {
// //         // Stop playback if no repeat is set
// //         setState(() {
// //           isPlaying = false;
// //           position = Duration.zero;
// //         });
// //       }
// //     });
// //   }

// //   // Play or pause the audio
// //   void playPause() {
// //     if (isPlaying) {
// //       audioplayer.pause();
// //     } else {
// //       audioplayer.play(
// //         AssetSource(nom[currentIndex].music!),
// //       );
// //     }
// //     setState(() {
// //       isPlaying = !isPlaying;
// //     });
// //   }

// //   // Skip to the next song
// //   void skipToNext() {
// //     if (currentIndex < nom.length - 1) {
// //       setState(() {
// //         currentIndex++;
// //       });
// //       playSong();
// //     }
// //   }

// //   // Skip to the previous song
// //   void skipToPrevious() {
// //     if (currentIndex > 0) {
// //       setState(() {
// //         currentIndex--;
// //       });
// //       playSong();
// //     }
// //   }

// //   // Play the current song
// //   void playSong() {
// //     audioplayer.stop();
// //     audioplayer.play(
// //       AssetSource(nom[currentIndex].music!),
// //     );
// //     setState(() {
// //       isPlaying = true;
// //       position = Duration.zero;
// //     });
// //   }

// //   // Convert duration to a readable format (e.g., 1:30)
// //   String formatTime(Duration duration) {
// //     String twoDigits(int n) => n.toString().padLeft(2, '0');
// //     final minutes = twoDigits(
// //       duration.inMinutes.remainder(
// //         60,
// //       ),
// //     );
// //     final seconds = twoDigits(
// //       duration.inSeconds.remainder(
// //         60,
// //       ),
// //     );
// //     return '$minutes:$seconds';
// //   }

// //   // Toggle the repeat mode
// //   void toggleRepeatMode() {
// //     setState(() {
// //       if (repeatOne) {
// //         // If currently repeating one song, switch to repeat all
// //         repeatOne = false;
// //         repeatAll = true;
// //       } else if (repeatAll) {
// //         // If currently repeating all, turn off repeat
// //         repeatAll = false;
// //       } else {
// //         // If no repeat, set to repeat one song
// //         repeatOne = true;
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         height: double.infinity,
// //         width: double.infinity,
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //             colors: [
// //               Colors.black,
// //               Colors.white,
// //             ],
// //           ),
// //         ),
// //         child: Center(
// //           child: Column(
// //             children: [
// //               Padding(
// //                 padding: EdgeInsets.all(30),
// //                 child: Container(
// //                   height: 280,
// //                   width: 280,
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(
// //                       image: AssetImage(
// //                         nom[currentIndex].photo!,
// //                       ),
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 10,
// //               ),
// //               Center(
// //                 child: Row(
// //                   children: [
// //                     SizedBox(
// //                       width: 70,
// //                     ),
// //                     Text(
// //                       nom[currentIndex].name!,
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 50,
// //               ),
// //               Slider(
// //                 min: 0,
// //                 max: duration.inSeconds.toDouble(),
// //                 // value: position.inSeconds.toDouble(),
// //                 value: position.inSeconds
// //                     .toDouble()
// //                     .clamp(0.0, duration.inSeconds.toDouble()),
// //                 onChanged: (value) async {
// //                   final newPosition = Duration(seconds: value.toInt());
// //                   await audioplayer.seek(newPosition);
// //                   setState(() {
// //                     position = newPosition;
// //                   });
// //                 },
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(formatTime(position)),
// //                     Text(formatTime(duration)),
// //                   ],
// //                 ),
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   SizedBox(width: 30),
// //                   IconButton(
// //                     onPressed: toggleRepeatMode,
// //                     icon: Icon(
// //                       Icons.restart_alt,
// //                       size: 45,
// //                       color: repeatOne
// //                           ? Colors.blue
// //                           : repeatAll
// //                               ? Colors.green
// //                               : Colors.white,
// //                     ),
// //                   ),
// //                   if (repeatOne)
// //                     Positioned(
// //                       right: 0,
// //                       top: 0,
// //                       child: CircleAvatar(
// //                         radius: 10,
// //                         backgroundColor: Colors.black,
// //                         child: Text(
// //                           '1',
// //                           style: TextStyle(fontSize: 12, color: Colors.white,),
// //                         ),
// //                       ),
// //                     ),
// //                   SizedBox(
// //                     width: 15,
// //                   ),
// //                   IconButton(
// //                     onPressed: skipToPrevious,
// //                     icon: Icon(
// //                       Icons.skip_previous_sharp,
// //                       size: 50,
// //                     ),
// //                   ),
// //                   SizedBox(width: 35),
// //                   IconButton(
// //                     onPressed: playPause,
// //                     icon: Icon(
// //                       isPlaying ? Icons.pause : Icons.play_arrow,
// //                     ),
// //                     iconSize: 50,
// //                   ),
// //                   SizedBox(
// //                     width: 30,
// //                   ),
// //                   IconButton(
// //                     onPressed: skipToNext,
// //                     icon: Icon(
// //                       Icons.skip_next_sharp,
// //                       size: 50,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 30,
// //                   ),
// //                   IconButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         showSongList = !showSongList;
// //                       });
// //                     },
// //                     icon: Icon(
// //                       Icons.queue_music_outlined,
// //                       size: 45,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 20,
// //                   ),
// //                 ],
// //               ),
// //               if (showSongList)
// //                 Expanded(
// //                   child: ListView.builder(
// //                     itemCount: nom.length,
// //                     itemBuilder: (context, index) {
// //                       return ListTile(
// //                         leading: CircleAvatar(
// //                           backgroundImage: AssetImage(nom[index].photo!),
// //                         ),
// //                         title: Text(nom[index].name!),
// //                         onTap: () {
// //                           setState(() {
// //                             currentIndex = index;
// //                             playSong();
// //                             showSongList = false;
// //                           });
// //                         },
// //                       );
// //                     },
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class A {
// //   String? photo;
// //   String? music;
// //   String? name;
// //   A({
// //     this.name,
// //     this.music,
// //     this.photo,
// //   });
// // }

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:audioplayers/audioplayers.dart';
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.light,
//         /* light theme settings */
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         /* dark theme settings */
//       ),
//       themeMode: ThemeMode.dark,
//       /* ThemeMode.system to follow system theme, 
//          ThemeMode.light for light theme, 
//          ThemeMode.dark for dark theme
//       */
//       debugShowCheckedModeBanner: false,
//       home: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
//   Brightness? _brightness;
//   @override
//   void initState() {
//     WidgetsBinding.instance?.addObserver(this);
//     _brightness = WidgetsBinding.instance?.window.platformBrightness;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangePlatformBrightness() {
//     if (mounted) {
//       setState(() {
//         _brightness = WidgetsBinding.instance?.window.platformBrightness;
//       });
//     }

//     super.didChangePlatformBrightness();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[50],
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 120,
//               ),
//               Text(
//                 "Quran App",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w900,
//                   color: Color.fromARGB(255, 0, 255, 8),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 60,
//               ),
//               Text(
//                 "Har kuni Quron o'rganing",
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Color.fromARGB(255, 0, 255, 8),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Container(
//             height: 600,
//             width: 500,
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: 32,
//                   child: Container(
//                     height: 530,
//                     width: 330,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           "https://i.pinimg.com/564x/e3/f0/8c/e3f08c961e00df85aa3bc0e836085c18.jpg",
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                       color: Color.fromARGB(255, 0, 255, 8),
//                       borderRadius: BorderRadius.circular(
//                         50,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 480,
//                   left: 65,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Sahifa(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 100,
//                       width: 260,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(
//                           75,
//                         ),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(
//                               "   keyingi sahifa",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios,
//                               color: Colors.black,
//                               size: 25,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Sahifa extends StatefulWidget {
//   @override
//   State<Sahifa> createState() => _SahifaState();
// }

// class _SahifaState extends State<Sahifa> {
//   List<Map<String, dynamic>> data = [];
//   bool kutish = true;

//   Future<void> fetchData() async {
//     final response = await http.get(
//       Uri.parse("https://api.alquran.cloud/v1/quran/uz.sodik"),
//     );

//     if (response.statusCode == 200) {
//       final jsondata = jsonDecode(response.body);
//       final surahs = jsondata['data']['surahs'] as List;
//       setState(() {
//         data = surahs.map((item) => Map<String, dynamic>.from(item)).toList();
//       });
//     } else {
//       throw Exception("Failed to load data");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 50),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Quran App",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 30,
//                   color: Color.fromARGB(255, 0, 255, 8),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Text(
//                   "Assalomu Aleykum \n    va rahmatulloh",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Color.fromARGB(255, 0, 255, 8),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 235,
//             width: 350,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(
//                     255,
//                     0,
//                     255,
//                     8,
//                   ),
//                   offset: Offset(
//                     5,
//                     5,
//                   ),
//                   blurRadius: 10,
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(25),
//               color: Colors.grey[100],
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(8.5),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "Quroni karimning\n  30 Pora",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 180,
//                         width: 140,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               'https://i.pinimg.com/564x/e2/8b/35/e28b3500f009332209532513119f80a2.jpg',
//                             ),
//                             fit: BoxFit.fitHeight,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             SurahDetail(surahData: data[index]),
//                       ),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(15),
//                     child: Container(
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "${data[index]['englishName']}",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "${data[index]['name']}",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "${data[index]['revelationType']}",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SurahDetail extends StatefulWidget {
//   final Map<String, dynamic> surahData;

//   SurahDetail({required this.surahData});

//   @override
//   _SurahDetailState createState() => _SurahDetailState();
// }

// class _SurahDetailState extends State<SurahDetail> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     // Load the audio for this Surah
//     String audioUrl = widget.surahData['audioUrl']; // Ensure you have a valid URL
//     setupAudio(audioUrl);
//   }

//   void setupAudio(String url) async {
//     await audioPlayer.setSourceUrl(url);

//     audioPlayer.onDurationChanged.listen((Duration newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });

//     audioPlayer.onPositionChanged.listen((Duration newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ayahs = widget.surahData['ayahs'] as List<dynamic>;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.surahData['englishName']),
//       ),
//       body: Column(
//         children: [
//           // Slider for audio control
//           Slider(
//             min: 0,
//             max: duration.inSeconds.toDouble(),
//             value: position.inSeconds.toDouble().clamp(0.0, duration.inSeconds.toDouble()),
//             onChanged: (value) async {
//               final newPosition = Duration(seconds: value.toInt());
//               await audioPlayer.seek(newPosition);
//               setState(() {
//                 position = newPosition;
//               });
//             },
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: ayahs.length,
//               itemBuilder: (context, index) {
//                 final ayah = ayahs[index];
//                 return Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(
//                       "${ayah['text']}",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (audioPlayer.state == PlayerState.playing) {
//             audioPlayer.pause();
//           } else {
//             audioPlayer.resume();
//           }
//         },
//         child: Icon(
//           audioPlayer.state == PlayerState.playing ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }


// // class Sahifa extends StatefulWidget {
// //   @override
// //   State<Sahifa> createState() => _SahifaState();
// // }

// // class _SahifaState extends State<Sahifa> {
// //   List<Map<String, dynamic>> data = [];
// //   bool kutish = true;

// //   Future<void> fetchData() async {
// //     final response = await http.get(
// //       Uri.parse("https://api.alquran.cloud/v1/quran/uz.sodik"),
// //     );

// //     if (response.statusCode == 200) {
// //       final jsondata = jsonDecode(response.body);
// //       final surahs = jsondata['data']['surahs'] as List;
// //       setState(() {
// //         data = surahs.map((item) => Map<String, dynamic>.from(item)).toList();
// //       });
// //     } else {
// //       throw Exception("Failed to load data");
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchData();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           SizedBox(height: 50),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text(
// //                 "Quran App",
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.w900,
// //                   fontSize: 30,
// //                   color: Color.fromARGB(255, 0, 255, 8),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Center(
// //                 child: Text(
// //                   "Assalomu Aleykum \n    va rahmatulloh",
// //                   style: TextStyle(
// //                     fontSize: 25,
// //                     color: Color.fromARGB(255, 0, 255, 8),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Container(
// //             height: 235,
// //             width: 350,
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Color.fromARGB(
// //                     255,
// //                     0,
// //                     255,
// //                     8,
// //                   ),
// //                   offset: Offset(
// //                     5,
// //                     5,
// //                   ),
// //                   blurRadius: 10,
// //                 ),
// //               ],
// //               borderRadius: BorderRadius.circular(25),
// //               color: Colors.grey[100],
// //             ),
// //             child: Padding(
// //               padding: EdgeInsets.all(8.5),
// //               child: Column(
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Column(
// //                         children: [
// //                           Text(
// //                             "Quroni karimning\n  30 Pora",
// //                             style: TextStyle(
// //                               // fontSize: 0,
// //                               fontWeight: FontWeight.w900,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       Container(
// //                         height: 180,
// //                         width: 140,
// //                         decoration: BoxDecoration(
// //                           image: DecorationImage(
// //                             image: NetworkImage(
// //                               'https://i.pinimg.com/564x/e2/8b/35/e28b3500f009332209532513119f80a2.jpg',
// //                             ),
// //                             fit: BoxFit.fitHeight,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 30,
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: data.length,
// //               itemBuilder: (context, index) {
// //                 return GestureDetector(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) =>
// //                             SurahDetail(surahData: data[index]),
// //                       ),
// //                     );
// //                   },
// //                   child: Padding(
// //                     padding: EdgeInsets.all(15),
// //                     child: Container(
// //                       height: 150,
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(20),
// //                         color: Colors.white,
// //                       ),
// //                       child: Padding(
// //                         padding: EdgeInsets.all(10),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "${data[index]['englishName']}",
// //                               style: TextStyle(
// //                                 fontSize: 22,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Text(
// //                               "${data[index]['name']}",
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 color: Colors.grey[700],
// //                               ),
// //                             ),
// //                             SizedBox(height: 5),
// //                             Text(
// //                               "${data[index]['revelationType']}",
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.grey[600],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class SurahDetail extends StatelessWidget {
// //   final Map<String, dynamic> surahData;

// //   SurahDetail({required this.surahData});

// //   @override
// //   Widget build(BuildContext context) {
// //     final ayahs = surahData['ayahs'] as List<dynamic>;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(surahData['englishName']),
// //       ),
// //       body: Column(
// //         children: [
// //           Slider(
// //                 min: 0,
// //                 max: duration.inSeconds.toDouble(),
// //                 // value: position.inSeconds.toDouble(),
// //                 value: position.inSeconds
// //                     .toDouble()
// //                     .clamp(0.0, duration.inSeconds.toDouble()),
// //                 onChanged: (value) async {
// //                   final newPosition = Duration(seconds: value.toInt());
// //                   await audioplayer.seek(newPosition);
// //                   setState(() {
// //                     position = newPosition;
// //                   });
// //                 },
// //               ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: ayahs.length,
// //               itemBuilder: (context, index) {
// //                 final ayah = ayahs[index];
// //                 return Padding(
// //                   padding: EdgeInsets.all(8.0),
// //                   child: ListTile(
// //                     title: Text(
// //                       "${ayah['text']}",
// //                       style: TextStyle(fontSize: 20),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

