import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

import '../mock_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Horizontal(),
    );
  }
}

class Horizontal extends StatefulWidget {
  const Horizontal({super.key});

  @override
  State<Horizontal> createState() => _HorizontalState();
}

class _HorizontalState extends State<Horizontal> {
  final bool _loop = true;

  // Scroll controller for carousel
  late InfiniteScrollController _controller;

  // Maintain current index of carousel
  int _selectedIndex = 0;

  // Width of each item
  double? _itemExtent;

  // Get screen width of viewport.
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: _selectedIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemExtent = screenWidth - 200;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final ValueNotifier<double> _valueNotifier = ValueNotifier(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Pro-Planet App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
            wordSpacing: 3.0,
            fontFamily: 'LibreBaskerville',
          ),
        ),
        centerTitle: true,
        elevation: 10.0,
        leading: TextButton(
          onPressed: () {
            print('object');
          },
          child: Icon(
            Icons.menu_rounded,
            size: 40.0,
            color: Colors.black,
            fill: 1.0,
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: InfiniteCarousel.builder(
                itemCount: kDemoImages.length,
                itemExtent: _itemExtent ?? 40,
                scrollBehavior: kIsWeb
                    ? ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          // Allows to swipe in web browsers
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse
                        },
                      )
                    : null,
                loop: _loop,
                controller: _controller,
                onIndexChanged: (index) {
                  if (_selectedIndex != index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
                },
                itemBuilder: (context, itemIndex, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: GestureDetector(
                      onTap: () {
                        _controller.animateToItem(realIndex);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: kElevationToShadow[2],
                          image: DecorationImage(
                            image: AssetImage(kDemoImages[itemIndex]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: const [
                  Color(0xffb2c3e50),
                  Color(0xffb06beb6),
                  Color(0xffb48b1bf),
                  Color(0xffb56ab2f),
                  Color(0xffba8e063),
                  Color(0xffbeacda3),
                  Color(0xffbd6ae7b),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(
                bounds,
              ),
              child: Center(
                child: Text(
                  'You are a Pro-Planet Person',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'LibreBaskerville',
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                flex: 1,
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 2.5, // width ÷ height
                  valueNotifier: _valueNotifier,
                  progress: 450,
                  maxProgress: 600,
                  corners: StrokeCap.butt,
                  foregroundColor: Colors.green,
                  backgroundColor: const Color(0xffeeeeee),
                  foregroundStrokeWidth: 10,
                  backgroundStrokeWidth: 10,
                  animation: true,
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => Text(
                        '${value.toInt()}%',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Health Factors - 100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Waste Management - 90',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Recycling - 110',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            CupertinoPageScaffold(
                backgroundColor: Colors.black,
                child: CupertinoListSection(
                  backgroundColor: Colors.black,
                  header: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          // Color(0xffb2c3e50),
                          // Color(0xffb06beb6),
                          // Color(0xffbeacda3),
                          // Color(0xffbd6ae7b),
                          Color(0xffb000428),
                          Color(0xffb004e92),
                        ],
                        //stops: [0.1, 0.2, 0.5, 0.75],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        transform: GradientRotation(90),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Tips',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'LibreBaskerville',
                            letterSpacing: 3.0,
                            color: Colors.white60,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  children: const [
                    CupertinoListTile(
                      title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '1- Reduce your power usage',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'AveriaSansLibre',
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    CupertinoListTile(
                      title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '2- Reduce your power usage',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'AveriaSansLibre',
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    CupertinoListTile(
                      title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '3- Reduce your power usage',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'AveriaSansLibre',
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    CupertinoListTile(
                      title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '4- Reduce your power usage',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'AveriaSansLibre',
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
            ),
            SizedBox(
              width: double.infinity,
              height: 22,
              child: BottomAppBar(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const[
                    Icon(Icons.arrow_back,color: Colors.white,),
                    Icon(Icons.home,color: Colors.white,),
                    Icon(Icons.menu,color: Colors.white,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
