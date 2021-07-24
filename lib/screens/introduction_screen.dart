import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:fashup/screens/initialize.dart';

class IntroductionScreen extends StatefulWidget {
  static String id = 'IntroductionScreen';

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Welcome to Fashup",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet lectus aliquam, dictum diam in, sollicitudin ligula. Mauris non arcu pretium, tempus tellus id, sodales est.",
        pathImage: "images/animated_logo.gif",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "Welcome 2",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/animated_logo.gif",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "Welcome 3",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/animated_logo.gif",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.pushNamed(context, Initialize.id);
    print("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
