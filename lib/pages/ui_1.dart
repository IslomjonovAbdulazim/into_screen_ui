import 'package:flutter/material.dart';

/// github: https://github.com/afgprogrammer/Flutter-App-Intro-With-Indicator
// colors
Color primary = const Color.fromRGBO(52, 43, 37, 1);
Color gray = const Color.fromRGBO(137, 137, 137, 1);
Color secondary = const Color.fromRGBO(198, 116, 27, 1);
Color secondaryLight = const Color.fromRGBO(226, 185, 141, 1);
// strings
String stepOneTitle = "Farm Driving";
String stepOneContent =
    "There are all kinds of equipment to build your farm better harvest";
String stepTwoTitle = "Plant Growing";
String stepTwoContent =
    "Be part of the agriculture and gives your team the  power you need to do your best";
String stepThreeTitle = "Fast Harvesting";
String stepThreeContent =
    "Your will be proud to be part of agriculture and it’s harvest";

class UI1 extends StatefulWidget {
  @override
  _UI1State createState() => _UI1State();
}

class _UI1State extends State<UI1> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Text(
              'Skip',
              style: TextStyle(
                color: gray,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                image: 'assets/images/step-one.png',
                title: stepOneTitle,
                content: stepOneContent,
              ),
              makePage(
                reverse: true,
                image: 'assets/images/step-two.png',
                title: stepTwoTitle,
                content: stepTwoContent,
              ),
              makePage(
                image: 'assets/images/step-three.png',
                title: stepThreeTitle,
                content: stepThreeContent,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              : const SizedBox(),
          Text(
            title,
            style: TextStyle(
                color: primary, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: gray, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          reverse
              ? Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
