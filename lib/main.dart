import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: 0, upperBound: double.infinity);

    _simulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 600,
        damping: 15,
      ),
      0,
      100,
      0,
    );
    _controller.animateWith(_simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
                offset: Offset(0, _controller.value),
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 255, 47, 0),
                          Color.fromARGB(255, 33, 107, 243),
                        ],
                      ),
                      shape: BoxShape.circle,
                    )));
          }),
    ));
  }
}
