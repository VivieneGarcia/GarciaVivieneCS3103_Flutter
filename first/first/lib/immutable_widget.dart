import 'package:flutter/material.dart';

class ImmutableWidget extends StatelessWidget {
  const ImmutableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.green, // Center color
            Color.fromARGB(255, 58, 90, 22), // Outer color
          ],
          radius: 1.0, // Radius of the gradient
          center: Alignment.center, // Center point of the gradient
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(90),
        child: Transform.rotate(
          angle: 0.7854, // 45 degrees in radians (π/4)
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20.0), // Border radius
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 4, 21, 32)
                      .withOpacity(0.5), // Shadow color
                  offset: const Offset(16, 16), // Move shadow down (y value)
                  blurRadius: 6, // How blurry the shadow is
                  spreadRadius: 1, // Shadow spread
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: _buildShinyCircle(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShinyCircle() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.lightBlueAccent,
            Colors.blueAccent,
          ],
          center: Alignment(-0.3, -0.5),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20),
        ],
      ),
    );
  }
}
