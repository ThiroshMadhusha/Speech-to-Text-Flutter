import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {

var text = "Hold the button to speak";
var isListening = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // action button on bottom
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: bgColor,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,

        // GestureDetector is a widget that detects gestures
        child: GestureDetector(
          onTapDown:(details) {
            setState(() {
              isListening = true;
              text = "Listening...";
            });
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
              text = "Hold the button to speak";
            });
          },
          
          // CircleAvatar is a circular widget with background color and radius
          child: const CircleAvatar(
            backgroundColor: bgColor,
            radius: 35,
            child: Icon(Icons.mic, color: Colors.white),
          ),
        )
      ),

      // navigation bar
      appBar: AppBar(
        leading: const Icon(Icons.sort_rounded, color: Colors.white),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0.0,
        title: const Text('Voice Assistant', style:TextStyle(
          color: textColor,
        )),
      ),

      // body of the screen 
      body: Container(
        // color: Colors.red,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.only(bottom: 150, left: 16, right: 16, top: 16),
        child: Text(text, 
        style: const TextStyle(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}