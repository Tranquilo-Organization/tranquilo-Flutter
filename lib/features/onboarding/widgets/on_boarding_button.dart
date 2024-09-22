import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ring_indicator.dart';

class FillableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color fillColor;
  final Color textColor;
  final double progress;

  const FillableButton({
    super.key,
    required this.onPressed,
    required this.fillColor,
    required this.textColor,
    required this.progress,
  });

  @override
  State<FillableButton> createState() => _FillableButtonState();
}

class _FillableButtonState extends State<FillableButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: RingIndicatorPainter(
                color: widget.fillColor,
                progress: widget.progress,
              ),
              size: const Size(100.0, 100.0),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: widget.fillColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/arrow.svg',
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
