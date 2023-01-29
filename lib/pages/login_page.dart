import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_valorant/pages/home_page.dart';
import 'package:flutter_valorant/utils/app_theme.dart';
import 'package:flutter_valorant/widgets/button_primary.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) => FlutterNativeSplash.remove(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: mediaQuerySize.width,
        height: mediaQuerySize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/valorant_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              width: mediaQuerySize.width,
              top: mediaQuerySize.height * 0.36,
              child: SvgPicture.asset(
                'images/logo_valorant.svg',
                width: 175,
                height: 112,
                color: AppTheme.colorWhite,
              ),
            ),
            Positioned(
              right: -mediaQuerySize.width * 0.40,
              width: mediaQuerySize.width,
              height: mediaQuerySize.height,
              child: SvgPicture.asset(
                'images/logo_text_valorant.svg',
                color: AppTheme.colorWhite,
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonPrimary(
                      mediaQuerySize: mediaQuerySize,
                      text: 'CONNECT RIOT ACCOUNT',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    const ButtonCreateAccount()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonCreateAccount extends StatelessWidget {
  const ButtonCreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              side: const BorderSide(width: 1, color: AppTheme.colorWhite),
              backgroundColor: Colors.transparent,
              minimumSize: const Size.fromHeight(48),
            ),
            child: const Text('CREATE ACCOUNT'),
          ),
        ),
      ),
    );
  }
}
