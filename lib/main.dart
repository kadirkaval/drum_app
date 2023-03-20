import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrumPage(),
    );
  }
}

class DrumPage extends StatefulWidget {
  const DrumPage({Key? key}) : super(key: key);

  @override
  State<DrumPage> createState() => _DrumPageState();
}

class _DrumPageState extends State<DrumPage> {
  final player = AudioPlayer();
  void playSound(String sound){
    player.play(AssetSource(sound));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildSoundBox('bongo.wav', 'bip.wav', Colors.blueAccent, Colors.red),
          buildSoundBox('clap1.wav', 'clap2.wav', Colors.amber, Colors.green),
          buildSoundBox('how.wav', 'oobah.wav', Colors.purpleAccent, Colors.indigo),
          buildSoundBox('ridebel.wav', 'woo.wav', Colors.brown, Colors.blueGrey),

        ],
      ),
    );
  }

  Expanded buildSoundBox(String soundName1, String soundName2, Color color1, Color color2) {
    return Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(soundName1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(soundName2);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: color2, borderRadius: BorderRadius.circular(10)),

                  ),
                ),
              ),
            ],
          ),
        );
  }
}
