import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: NomPage(),
    ),
  );
}

class NomPage extends StatefulWidget {
  const NomPage({super.key});

  @override
  State<NomPage> createState() => NomPageState();
}

class NomPageState extends State<NomPage> {
  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int currentIndex = 0; // Current song index
  bool showSongList = false; // Toggle visibility of song list
  bool repeatOne = false; // Toggle repeat mode for a single song
  bool repeatAll = false; // Toggle repeat mode for all songs

  // List of songs
  List<A> nom = [
    A(
      name: "Нежно",
      photo: "image/rasm1.jpg",
      music: "speed.mp3",
    ),
    A(
      name: "Memories",
      photo: "image/rasm2.jpg",
      music: "Memories.mp3",
    ),
    A(
      name: "Life Letters",
      photo: "image/rasm3.jpg",
      music: "Life Letters.mp3",
    ),
    A(
      name: "All of the girls you loved before",
      photo: "image/rasm4.jpg",
      music: "All of the girls you loved before.mp3",
    ),
    A(
      name: "Pa Papy",
      photo: "image/rasm5.jpg",
      music: "PaPapy.mp3",
    ),
    A(
      name: "По шекам слёзи",
      photo: "image/rasm6.jpg",
      music: "poshekamslozi.mp3",
    ),
    A(
      name: "SI Ai",
      photo: "image/rasm7.jpg",
      music: "SI Ai .mp3",
    ),
    A(
      name: "Нежно",
      photo: "image/rasm8.jpg",
      music: "speed.mp3",
    ),
    A(
      name: "Моя пленница _ slowed",
      photo: "image/rasm0.jpg",
      music: "Моя пленница _ slowed.mp3",
    ),
    A(
      name: "Убегая от судьбы",
      photo: "image/rasm11.jpg",
      music: "Убегая от судьбы.mp3",
    ),
    A(
      name: "hood baby 8d",
      photo: "image/photo_2024-09-20_22-16-40.jpg",
      music: "hood baby 8d.mp3",
    ),
    A(
      name: "chikiri bang bang",
      photo: "image/rasm12.jpg",
      music: "chikiri bang bang.mp3",
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Load audio file duration
    audioplayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Update slider position as audio plays
    audioplayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // Detect when playback finishes
    audioplayer.onPlayerComplete.listen((_) {
      if (repeatOne) {
        // Repeat the current song
        playSong();
      } else if (repeatAll && currentIndex == nom.length - 1) {
        // If it's the last song and repeat all is on, go to the first song
        currentIndex = 0;
        playSong();
      } else if (currentIndex < nom.length - 1) {
        // Move to the next song
        skipToNext();
      } else {
        // Stop playback if no repeat is set
        setState(() {
          isPlaying = false;
          position = Duration.zero;
        });
      }
    });
  }

  // Play or pause the audio
  void playPause() {
    if (isPlaying) {
      audioplayer.pause();
    } else {
      audioplayer.play(
        AssetSource(nom[currentIndex].music!),
      );
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  // Skip to the next song
  void skipToNext() {
    if (currentIndex < nom.length - 1) {
      setState(() {
        currentIndex++;
      });
      playSong();
    }
  }

  // Skip to the previous song
  void skipToPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      playSong();
    }
  }

  // Play the current song
  void playSong() {
    audioplayer.stop();
    audioplayer.play(
      AssetSource(nom[currentIndex].music!),
    );
    setState(() {
      isPlaying = true;
      position = Duration.zero;
    });
  }

  // Convert duration to a readable format (e.g., 1:30)
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(
      duration.inMinutes.remainder(
        60,
      ),
    );
    final seconds = twoDigits(
      duration.inSeconds.remainder(
        60,
      ),
    );
    return '$minutes:$seconds';
  }

  // Toggle the repeat mode
  void toggleRepeatMode() {
    setState(() {
      if (repeatOne) {
        // If currently repeating one song, switch to repeat all
        repeatOne = false;
        repeatAll = true;
      } else if (repeatAll) {
        // If currently repeating all, turn off repeat
        repeatAll = false;
      } else {
        // If no repeat, set to repeat one song
        repeatOne = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        nom[currentIndex].photo!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      nom[currentIndex].name!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                // value: position.inSeconds.toDouble(),
                value: position.inSeconds
                    .toDouble()
                    .clamp(0.0, duration.inSeconds.toDouble()),
                onChanged: (value) async {
                  final newPosition = Duration(seconds: value.toInt());
                  await audioplayer.seek(newPosition);
                  setState(() {
                    position = newPosition;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 30),
                  IconButton(
                    onPressed: toggleRepeatMode,
                    icon: Icon(
                      Icons.restart_alt,
                      size: 45,
                      color: repeatOne
                          ? Colors.blue
                          : repeatAll
                              ? Colors.green
                              : Colors.white,
                    ),
                  ),
                  if (repeatOne)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 12, color: Colors.white,),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: skipToPrevious,
                    icon: Icon(
                      Icons.skip_previous_sharp,
                      size: 50,
                    ),
                  ),
                  SizedBox(width: 35),
                  IconButton(
                    onPressed: playPause,
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    iconSize: 50,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: skipToNext,
                    icon: Icon(
                      Icons.skip_next_sharp,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showSongList = !showSongList;
                      });
                    },
                    icon: Icon(
                      Icons.queue_music_outlined,
                      size: 45,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              if (showSongList)
                Expanded(
                  child: ListView.builder(
                    itemCount: nom.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(nom[index].photo!),
                        ),
                        title: Text(nom[index].name!),
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            playSong();
                            showSongList = false;
                          });
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class A {
  String? photo;
  String? music;
  String? name;
  A({
    this.name,
    this.music,
    this.photo,
  });
}
