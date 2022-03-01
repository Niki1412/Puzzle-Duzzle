import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import './slide_puzzle.dart';

class Levels extends StatefulWidget {
  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  bool playing = false;
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
                  setState(
                    () {
                      _player.pause();
                      playbutton = Icons.volume_mute;
                      playing = false;
                    },
                  );
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LEVELS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SlidePuzzle('EASY'),
                        ),
                      );
                    },
                    child: const Text(
                      'EASY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SlidePuzzle('MEDIUM'),
                        ),
                      );
                    },
                    child: const Text(
                      'MEDIUM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SlidePuzzle('HARD'),
                        ),
                      );
                    },
                    child: const Text(
                      'HARD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
