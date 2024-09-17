import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ring_indicator.dart'; // Ensure correct import path

class FillableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color fillColor;
  final Color textColor;
  final double progress;

  const FillableButton({
    Key? key,
    required this.onPressed,
    required this.fillColor,
    required this.textColor,
    required this.progress,
  }) : super(key: key);

  @override
  _FillableButtonState createState() => _FillableButtonState();
}

class _FillableButtonState extends State<FillableButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: 100.0, // Adjust size as needed
        height: 100.0, // Adjust size as needed
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circular indicator with filling effect
            CustomPaint(
              painter: RingIndicatorPainter(
                color: widget.fillColor,
                progress: widget.progress,
              ),
              size: Size(100.0, 100.0), // Adjust size to match button
            ),
            // Circular button with SVG icon
            Container(
              width: 60.0, // Button size
              height: 60.0, // Button size
              decoration: BoxDecoration(
                color: widget.fillColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/arrow.svg',
                  color: widget.textColor,
                  width: 24.0, // Adjust size as needed
                  height: 24.0, // Adjust size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
