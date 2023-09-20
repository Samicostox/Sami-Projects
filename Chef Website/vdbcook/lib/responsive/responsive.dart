import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? phone;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.phone,
  }) : super(key: key);

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < 1070 ;

  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1070 &&
        MediaQuery.of(context).size.width <= 1800;
  }




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1070) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1800 &&
            constraints.maxWidth >= 1070) {
          return mediumScreen ?? largeScreen;
        } else {
          return phone ?? largeScreen;
        }

      },
    );
  }
}