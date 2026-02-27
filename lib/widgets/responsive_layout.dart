import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= ResponsiveBreakpoints.desktop) {
      return desktop ?? tablet ?? mobile;
    } else if (width >= ResponsiveBreakpoints.tablet) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

class ResponsiveBreakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}
