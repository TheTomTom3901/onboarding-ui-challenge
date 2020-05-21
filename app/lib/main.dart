import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

var pages = [
  {
    'asset': 'assets/dancing.png',
    'title': 'MUSIC',
    'body': 'EXPERIENCE WICKED PLAYLISTS',
    'gradient': [Color(0xFFB721FF), Color(0xFF21D4FD)],
  },
  {
    'asset': 'assets/meditate.png',
    'title': 'SPA',
    'body': 'FEEL THE MAGIC OF WELLNESS',
    'gradient': [Color(0xFFFA709A), Color(0xFFFEE140)],
  },
  {
    'asset': 'assets/hiking.png',
    'title': 'TRAVEL',
    'body': 'LET’S HIKE UP!',
    'gradient': [Color(0xFF92FE9D), Color(0xFF00C9FF)],
  },
  {
    'asset': 'assets/computer.png',
    'title': 'E-BOOKS',
    'body': 'HAVE A BREAK, HAVE A E-BOOK',
    'gradient': [Color(0xFFFFE29F), Color(0xFFFFA99F), Color(0xFFFF719A)],
  },
];

void main() => runApp(OnboardingApp());

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding UI Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    Key key,
  }) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF485563), Color(0xFF29323C)],
          tileMode: TileMode.clamp,
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView.builder(
          onPageChanged: (i) {
            setState(() {
              _currentPage = i;
            });
          },
          controller: _pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  pages[index]['asset'],
                  height: 400,
                  width: double.infinity,
                ),
                Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.2,
                      child: GradientText(
                        pages[index]['title'],
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 80, fontFamily: 'Montserrat-Black', letterSpacing: -6),
                        gradient: LinearGradient(
                          colors: pages[index]['gradient'],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0, top: 25.0),
                      child: GradientText(
                        pages[index]['title'],
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 60, fontFamily: 'Montserrat-Black', letterSpacing: -3),
                        gradient: LinearGradient(
                          colors: pages[index]['gradient'],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    pages[index]['body'],
                    style: TextStyle(
                      color: Color(0xFFD8D8D8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    width: 140,
                    child: PageIndicator(
                      index: _currentPage,
                      length: 4,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int index, length;

  const PageIndicator({
    Key key,
    this.index,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (i) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 5,
              color: i == index ? Color(0xFFD8D8D8) : Color(0xFFD8D8D8).withOpacity(0.1),
            ),
          ),
        );
      }),
    );
  }
}
