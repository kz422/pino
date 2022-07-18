import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pino/Widgets/glass_container.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _opneUrl(String host, [String? path]) async {
    final Uri link = Uri(scheme: 'https', host: host, path: path);
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: GestureDetector(
            onTap: () => _opneUrl('github.com', 'kz422'),
            child: Image.asset('images/github.png'),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [
            Color(0xff26516b),
            Color(0xff3f446d),
            Color(0xff442842),
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
                      const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 92,
                            backgroundImage: AssetImage('./images/avatar.jpg'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox.shrink(),
                              DefaultTextStyle(
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'INOUE\nKAZUKI',
                                      speed: const Duration(
                                        milliseconds: 150,
                                      ),
                                    ),
                                  ],
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
                            style: const TextStyle(color: Colors.white),
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
                          const Icon(
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '* * *',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height,
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '* * *',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          _glassContainer(
                            Devs(
                              'Flutter',
                              [
                                Apps('moood', 'apps.apple.com',
                                    '/jp/app/moood/id1602684350'),
                              ],
                            ),
                          ),
                          _glassContainer(
                            Devs(
                              'Vue',
                              [
                                Apps('sb4you', 'sb-4you.com', ''),
                                Apps('cpbd', 'cpbd.site', '', 'sasa'),
                              ],
                            ),
                          ),
                          _glassContainer(
                            Devs(
                              'React',
                              [
                                Apps('MovieHack', 'movie-hack.com', ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      )
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
    return const SizedBox.shrink();
  }

  Widget _glassContainer(Devs devs) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassContainer(
        width: 300,
        height: 350,
        radius: 40,
        borderRadius: BorderRadius.circular(20),
        blur: 40,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  './images/${devs.name.toLowerCase()}.png',
                ),
              ),
            ),
            Text(
              devs.name,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              height: 250,
              child: PageView.builder(
                controller: controller,
                itemCount: devs.apps.length,
                itemBuilder: (context, index) {
                  final app = devs.apps[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => _opneUrl(
                          app.host,
                          app.path!.isNotEmpty ? app.path : null,
                        ),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.asset(
                                'images/${app.appName.toLowerCase()}.png',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        app.appName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${index + 1} / ${devs.apps.length}',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Devs {
  final String name;
  final List<Apps> apps;

  Devs(this.name, this.apps);
}

class Apps {
  final String appName;
  final String host;
  final String? path;
  final String? desc;

  Apps(this.appName, this.host, [this.path, this.desc]);
}
