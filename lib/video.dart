import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController? _controller;

  void buttonPressed() async {
    if (_controller != null) {
      setState(() {
        _controller!= null && _controller!.value.isPlaying
        ? _controller!.pause()
        : _controller!.play();
      });
    }
  }

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",),)
    ..initialize().then((_) {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF04041A),
      body: Column(
        children: [
          Center(
            child: _controller != null && _controller!.value.isInitialized
            ? AspectRatio(aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
            )
            : Container(),
          ),
          Container(
            child: Text("Total Duration: " +_controller!.value.duration.toString()),
          ),
          Container(child: VideoProgressIndicator(_controller!, allowScrubbing: false,
          colors: VideoProgressColors(
            backgroundColor: Colors.redAccent,
            playedColor: Colors.red,
            bufferedColor: Colors.blue,
          ),),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_controller != null && _controller!.value.isPlaying
        ? Icons.pause
        : Icons.play_arrow,
        ),
        onPressed: buttonPressed,
      ),
    );
  }
}