import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
      size.width / 6,
      size.height - 40,
      size.width / 3,
      size.height - 20,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      2 * size.width / 3,
      size.height - 20,
    );
    path.quadraticBezierTo(
      5 * size.width / 6,
      size.height - 40,
      size.width,
      size.height - 20,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // No need to reclip in this example
  }
}
