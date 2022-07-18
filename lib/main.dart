import 'package:animated_segment/segment_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        // maxWidth: 2000,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> skills = ['Flutter', 'Vue', 'React', 'Python'];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [
            Color(0xff26516b),
            Color(0xff3f446d),
            // Color(0xff442842),
            Color(0xffe9bff1),
            // Color(0xffe9bff1),
          ],
          center: Alignment.center,
          radius: 2,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 92,
                            backgroundImage: AssetImage('images/avatar.jpg'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox.shrink(),
                              Text(
                                'INOUE\nKAZUKI',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'Portfolio with Flutter Web',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DefaultTextStyle(
                            style: TextStyle(color: Colors.white),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                WavyAnimatedText(
                                  'Scroll Down',
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Career',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Development',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white),
                      ),
                      AnimatedSegment(
                        segmentNames: ['Flutter', 'Vue', 'React'],
                        onSegmentChanged: (index) {
                          setState(() {
                            selected = index;
                          });
                          print('Selected Segment Index is: $index');
                        },
                        backgroundColor: Colors.white.withAlpha(70),
                        segmentTextColor: Colors.white,
                        rippleEffectColor: AppColors.primary,
                        selectedSegmentColor: Colors.pinkAccent,
                      ),
                      skillBuilder(selected)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget skillBuilder(int index) {
    switch (index) {
      case 0:
        return Text(skills[index]);
      case 1:
        return Text(skills[index]);
      case 2:
        return Text(skills[2]);
    }
    return SizedBox.shrink();
  }
}
