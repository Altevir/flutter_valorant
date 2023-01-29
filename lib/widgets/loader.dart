import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: mediaQuerySize.width,
        height: mediaQuerySize.height,
        color: AppTheme.colorRed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'images/loading.svg',
                color: AppTheme.colorWhite,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: AppTheme.colorWhite),
            ],
          ),
        ),
      ),
    );
  }
}
