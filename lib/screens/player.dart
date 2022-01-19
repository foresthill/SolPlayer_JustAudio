import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:solplayer_just_audio/screens/commons/player_buttons.dart';

/**
 * Flutter full app 1. Music Player: create a simple Flutter music player app
 * (Just Audio Tutorial)
 *  https://ishouldgotosleep.com/posts/simple-flutter-music-player-app/
 */
class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // _audioPlayer = AudioPlayer();

    // Set a sequence of audio sources that will be played by the audio player
    try {
      _audioPlayer
          .setAudioSource(ConcatenatingAudioSource(children: [
        AudioSource.uri(Uri.parse(
            "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3")),
        AudioSource.uri(Uri.parse(
            "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3")),
        AudioSource.uri(Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3")),
      ]))
          .catchError((error) {
        // catch load errors: 404, invalid url ..
        print("An error occured $error");
      });
    } catch (e, s) {
      print(s);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayerButtons(_audioPlayer),
      ),
    );
  }
}