import 'package:flutter/material.dart';

enum BreadcrumbType { first, middle, last }

class BreadcrumbClipper extends CustomClipper<Path> {
  final BreadcrumbType type;
  final double arrowWidth;

  BreadcrumbClipper({required this.type, this.arrowWidth = 12.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final h = size.height;
    final w = size.width;
    final aw = arrowWidth;
    final centerY = h / 2;

    switch (type) {
      case BreadcrumbType.first:
        path.moveTo(0, 0);
        path.lineTo(w - aw, 0);
        path.lineTo(w, centerY);
        path.lineTo(w - aw, h);
        path.lineTo(0, h);
        break;

      case BreadcrumbType.middle:
        path.moveTo(0, 0);
        path.lineTo(aw, centerY);
        path.lineTo(0, h);
        path.lineTo(w - aw, h);
        path.lineTo(w, centerY);
        path.lineTo(w - aw, 0);
        break;

      case BreadcrumbType.last:
        path.moveTo(0, 0);
        path.lineTo(aw, centerY);
        path.lineTo(0, h);
        path.lineTo(w, h);
        path.lineTo(w, 0);
        break;
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    if (oldClipper is BreadcrumbClipper) {
      return oldClipper.type != type || oldClipper.arrowWidth != arrowWidth;
    }
    return true;
  }
}
