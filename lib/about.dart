import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool playing = true;
  IconData playbutton = Icons.volume_up;

  late AudioPlayer _player;
  late AudioCache _cache;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _cache = AudioCache(fixedPlayer: _player);

    _cache.load('Song.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              iconSize: 30,
              onPressed: () {
                if (!playing) {
                  setState(() {
                    _cache.loop('Song.mp3');
                    playbutton = Icons.volume_up;
                    playing = true;
                  });
                } else {
                  setState(() {
                    _player.pause();
                    playbutton = Icons.volume_mute;
                    playing = false;
                  });
                }
              },
              icon: Icon(playbutton)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(22, 138, 173, 1).withOpacity(0.5),
              const Color.fromRGBO(118, 200, 147, 1).withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0, 1],
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'EASY LEVEL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      'This is a 3x3 grid game',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'assets/3x3.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'MEDIUM LEVEL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      'This is a 4x4 grid game',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'assets/4x4.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'HARD LEVEL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      'This is a 5x5 grid game',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'assets/5x5.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
