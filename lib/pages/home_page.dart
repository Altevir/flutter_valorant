import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_valorant/models/match.dart';
import 'package:flutter_valorant/models/player.dart';
import 'package:flutter_valorant/pages/select_agent_page.dart';
import 'package:flutter_valorant/repositories/agent_repository.dart';
import 'package:flutter_valorant/utils/app_theme.dart';
import 'package:flutter_valorant/widgets/app_bar_home.dart';
import 'package:flutter_valorant/widgets/button_primary.dart';
import 'package:flutter_valorant/widgets/card_match.dart';
import 'package:flutter_valorant/widgets/card_player.dart';
import 'package:flutter_valorant/widgets/card_rank.dart';
import 'package:flutter_valorant/widgets/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = Player(
      name: 'RAZE',
      hoursPlayed: 354,
      minutesPlayed: 35,
      winRatio: 62.11,
      winKd: 1.14,
      dmgRound: 138.2,
      image: 'raze.png',
      rank: 30);

  final List<PlayerMatch> matchs = AgentRepository.matchs;
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void navigateToSelectAgentPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return const SelectAgentPage();
        },
        transitionDuration: const Duration(milliseconds: 800),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(curve: Curves.linear, parent: animation);
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: isLoading,
      builder: (context, value, child) {
        return Scaffold(
          body: isLoading.value
              ? const Center(
                  child: Loader(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppBarHome(
                        color: Color(0xff1F2326),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              CardPlayer(player: player),
                              const SizedBox(height: 16),
                              CardRank(rankValue: player.rank),
                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  right: 24,
                                  bottom: 24,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Recent Match',
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.colorWhite,
                                          ),
                                        ),
                                        Text(
                                          'See All',
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppTheme.colorRed,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: matchs.length,
                                        itemBuilder: (context, index) {
                                          return CardMatch(
                                              match: matchs[index]);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 34,
                                    ),
                                    ButtonPrimary(
                                      mediaQuerySize: mediaQuerySize,
                                      text: 'FIND MATCH',
                                      onTap: () async {
                                        isLoading.value = true;
                                        await Future.delayed(
                                          const Duration(milliseconds: 2000),
                                        );
                                        isLoading.value = false;
                                        navigateToSelectAgentPage();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: -mediaQuerySize.width * 0.42,
                            top: 29,
                            width: mediaQuerySize.width,
                            child: FadeInRight(
                              duration: const Duration(milliseconds: 1200),
                              child: Image.asset(
                                'images/${player.image}',
                                fit: BoxFit.fitHeight,
                                height: 468,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
