import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import './easy_level.dart';
import './medium_level.dart';
import './hard_level.dart';

class SlidePuzzle extends StatefulWidget {
  final String difficultyLevel;

  SlidePuzzle(this.difficultyLevel);

  @override
  State<SlidePuzzle> createState() => _SlidePuzzleState();
}

class _SlidePuzzleState extends State<SlidePuzzle> {
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
        title: Text(widget.difficultyLevel),
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          if (widget.difficultyLevel == 'EASY')
                            EasyLevel()
                          else if (widget.difficultyLevel == 'MEDIUM')
                            MediumLevel()
                          else
                            HardLevel()
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
