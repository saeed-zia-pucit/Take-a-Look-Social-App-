
import 'package:flutter/material.dart';

class AboutTermPrivacy extends StatefulWidget {
  const AboutTermPrivacy({super.key, required this.aboutTermPrivacyType});

  final AboutTermPrivacyType aboutTermPrivacyType;

  @override
  State<AboutTermPrivacy> createState() => _AboutTermPrivacyState();
}

class _AboutTermPrivacyState extends State<AboutTermPrivacy> {

  String about = "They're using our own satellites against us. And the clock is ticking. Must go faster... go, go, go, go, go! Forget the fat lady! You're obsessed with the fat lady! Drive us out of here! So you two dig up, dig up dinosaurs? They're using our own satellites against us. And the clock is ticking.\n\nWhere is the videos from?\n\nYeah, but your scientists were so preoccupied with whether or not they could, they didn't stop to think if they should. Forget the fat lady! You're obsessed with the fat lady! Drive us out of here! Checkmate... Jaguar shark! So tell me - does it really exist?\n\nGod creates dinosaurs. God destroys dinosaurs. God creates Man. Man destroys God. Man creates Dinosaurs. Must go faster. Did he just throw my cat out of the window? You really think you can fly that thing? Hey, take a look at the earthlings. Goodbye!";
  String term = "They're using our own satellites against us. And the clock is ticking. Must go faster... go, go, go, go, go! Forget the fat lady! You're obsessed with the fat lady! Drive us out of here! So you two dig up, dig up dinosaurs? They're using our own satellites against us. And the clock is ticking.\n\nWhere is the videos from?\n\nYeah, but your scientists were so preoccupied with whether or not they could, they didn't stop to think if they should. Forget the fat lady! You're obsessed with the fat lady! Drive us out of here! Checkmate... Jaguar shark! So tell me - does it really exist?\n\nGod creates dinosaurs. God destroys dinosaurs. God creates Man. Man destroys God. Man creates Dinosaurs. Must go faster. Did he just throw my cat out of the window? You really think you can fly that thing? Hey, take a look at the earthlings. Goodbye!";
  String privacy = "They're using our own satellites against us. And the clock is ticking. Must go faster... go, go, go, go, go! Forget the fat lady! You're obsessed with the fat lady! Drive us out of here! So you two dig up, dig up dinosaurs? They're using our own satellites against us. And the clock is ticking.\n\nWhere is the videos from?\n\nYeah, but your scientists were so preoccupied with whether or not they could, they didn't stop to think if they should. Forget the fat lady! You're obsessed with the fat lady! Drive us out of here! Checkmate... Jaguar shark! So tell me - does it really exist?\n\nGod creates dinosaurs. God destroys dinosaurs. God creates Man. Man destroys God. Man creates Dinosaurs. Must go faster. Did he just throw my cat out of the window? You really think you can fly that thing? Hey, take a look at the earthlings. Goodbye!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        (widget.aboutTermPrivacyType == AboutTermPrivacyType.about) ?
        const Text('About Us') :
        (widget.aboutTermPrivacyType == AboutTermPrivacyType.term) ?
        const Text('Terms & Condition') :
        const Text('Privacy & Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(about),
      ),
    );
  }
}

enum AboutTermPrivacyType {
  about,
  term,
  privacy,
}