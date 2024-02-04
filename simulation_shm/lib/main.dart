import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

double av = 0;
double aa = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp(MyApp());
}

class PendulumGame extends FlameGame {
  final double pivotX;
  final double pivotY;
  final double threadLength;
  final double mass;
  final double threadThickness;
  final double gravity;
  final double friction;

  final Function(double, double) updateCallback;

  double angle = pi / 4; // initial angle
  double angularVelocity =2; // initial angular velocity
  double angularAcceleration = 0; // initial angular acceleration

  PendulumGame({
    required this.pivotX,
    required this.pivotY,
    required this.threadLength,
    required this.mass,
    required this.threadThickness,
    required this.gravity,
    required this.friction,
    required this.updateCallback,
  });

  @override
  void update(double dt) {
    // Calculate angular acceleration based on gravity and friction
    angularAcceleration = -(gravity * 15) / threadLength * sin(angle) - friction * angularVelocity;
    aa = angularAcceleration;

    // Update angular velocity
    angularVelocity += angularAcceleration * dt;
    av = angularVelocity;

    // Update angle
    angle += angularVelocity * dt;

    // Call the custom callback function with updated values
    updateCallback(av, aa);
  }

  @override
  void render(Canvas canvas) {
    // Draw the thread
    Paint threadPaint = Paint()..color = Colors.brown;
    canvas.drawLine(
      Offset(pivotX, pivotY),
      Offset(pivotX + sin(angle) * threadLength, pivotY + cos(angle) * threadLength),
      threadPaint,
    );

    // Calculate position of the bob
    double bobX = pivotX + sin(angle) * threadLength;
    double bobY = pivotY + cos(angle) * threadLength;

    // Draw the bob (mass)
    Paint bobPaint = Paint()..color = const Color.fromARGB(255, 238, 2, 2);
    canvas.drawCircle(
      Offset(bobX, bobY),
      mass / 2,
      bobPaint,
    );
  }
}

class PendulumDisplayBox extends StatefulWidget {
  final double gravity;
  final double friction;

  const PendulumDisplayBox({
    required this.gravity,
    required this.friction,
  });

  @override
  _PendulumDisplayBoxState createState() => _PendulumDisplayBoxState();
}

class _PendulumDisplayBoxState extends State<PendulumDisplayBox> {
  double angularVelocity = 0;
  double angularAcceleration = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Real-time Pendulum Constraints:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Text('Acceleration due to gravity: ${widget.gravity} m/s²'),
          Text('Friction coefficient: ${widget.friction}'),
          Text('Angular velocity: ${angularVelocity.toStringAsFixed(2)} rad/s²'),
          Text('Angular acceleration: ${angularAcceleration.toStringAsFixed(2)} rad/s²'),
        ],
      ),
    );
  }

  void updateValues(double av, double aa) {
    setState(() {
      angularVelocity = av;
      angularAcceleration = aa;
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pendulum Simulation'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const PendulumDisplayBox(
                gravity: 9.81,
                friction: 0.15, // Initialize with zero angular acceleration
              ),
              Expanded(
                child: Center(
                  child: GameWidget(
                    game: PendulumGame(
                      pivotX: MediaQuery.of(context).size.width / 2,
                      pivotY: 50,
                      threadLength: 200,
                      mass: 40,
                      threadThickness: 2,
                      gravity: 9.81,
                      friction: 0.15, // Friction coefficient
                      updateCallback: (av, aa) {
                        // No need to update here since it's handled in PendulumDisplayBox
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
