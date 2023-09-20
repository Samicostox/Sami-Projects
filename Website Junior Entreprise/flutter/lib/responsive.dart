import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? reallysmallScreen;
  final Widget? phone;
  final Widget? smallphone;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.reallysmallScreen,
    this.phone,
    this.smallphone,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1650 &&
        MediaQuery.of(context).size.width <= 1370;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 2200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1650 &&
        MediaQuery.of(context).size.width <= 2200;
  }
  static bool isReallySmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200 &&
        MediaQuery.of(context).size.width <= 1370;
  }

  static bool isReallyReallySmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1200 &&  MediaQuery.of(context).size.width >= 290;;
  }

  static bool issmallphone(BuildContext context) {
    return MediaQuery.of(context).size.width < 473;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 2200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 2200 &&
            constraints.maxWidth >= 1650) {
          return mediumScreen ?? largeScreen;
        } else if (constraints.maxWidth <= 1650 &&
            constraints.maxWidth >= 1370) {
          return smallScreen ?? largeScreen;
        }else if (constraints.maxWidth <= 1370 &&
            constraints.maxWidth >= 1200) {
          return reallysmallScreen ?? largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 473) {
          return phone ?? largeScreen;

        }else {
          return smallphone ?? largeScreen;
        }

      },
    );
  }
}