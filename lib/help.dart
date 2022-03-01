import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
      body: Stack(
        children: [
          Container(
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
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/1.png",
                      width: 420,
                    ),
                    Image.asset(
                      "assets/2.png",
                      width: 420,
                    ),
                    Image.asset(
                      "assets/3.png",
                      width: 420,
                    ),
                    Image.asset(
                      "assets/4.png",
                      width: 420,
                    ),
                    Image.asset(
                      "assets/5.png",
                      width: 300,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
