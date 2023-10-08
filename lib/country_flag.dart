import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 200), // Set the size of your flag
      painter: FlagPainter(), // Custom painter to draw the flag
    );
  }
}

class FlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors for each row
    final colors = [
      Colors.black,
      Colors.white,
      Colors.green,
      // Add more colors as needed
    ];

    // Calculate the height of each row
    final rowHeight = size.height / colors.length;

    // Draw each row with the respective color
    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      final rowRect = Rect.fromPoints(
        Offset(0, i * rowHeight),
        Offset(size.width, (i + 1) * rowHeight),
      );

      canvas.drawRect(rowRect, paint);
    }

    // Draw a triangle inside the flag (Palestinian flag style)
    final trianglePaint = Paint()
      ..color = Colors.red // Change the triangle color as needed
      ..style = PaintingStyle.fill;

    final trianglePath = Path();
    final triangleHeight = size.height / colors.length;

    // Calculate the triangle's points to resemble the Palestinian flag
    final startPoint =
        Offset(0, size.height / 6 - triangleHeight / 2); // Adjusted startPoint
    final topPoint =
        Offset(triangleHeight + 80, size.height / 2); // Adjusted topPoint
    final bottomPoint = Offset(
        0, size.height / 1.2 + triangleHeight / 2); // Adjusted bottomPoint

    trianglePath.moveTo(startPoint.dx, startPoint.dy);
    trianglePath.lineTo(topPoint.dx, topPoint.dy);
    trianglePath.lineTo(bottomPoint.dx, bottomPoint.dy);
    trianglePath.close();

    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
