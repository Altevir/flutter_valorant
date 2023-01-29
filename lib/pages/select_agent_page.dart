import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_valorant/models/agent.dart';
import 'package:flutter_valorant/repositories/agent_repository.dart';
import 'package:flutter_valorant/repositories/team_repository.dart';
import 'package:flutter_valorant/utils/app_theme.dart';
import 'package:flutter_valorant/widgets/button_primary.dart';

import '../widgets/app_bar_home.dart';

class SelectAgentPage extends StatefulWidget {
  const SelectAgentPage({super.key});

  @override
  State<SelectAgentPage> createState() => _SelectAgentPageState();
}

class _SelectAgentPageState extends State<SelectAgentPage> {
  String pathImage = '';
  List<Agent> players = TeamRepository.players;
  List<Agent> agents = AgentRepository.agents;

  void _changeImageBackground(String imgBackground) {
    setState(() {
      pathImage = 'images/$imgBackground';
    });
  }

  @override
  void initState() {
    super.initState();
    _changeImageBackground(agents[0].imgBackground!);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const AppBarHome(
            color: Color(0xff0B1925),
          ),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'images/background_page.png',
                  fit: BoxFit.cover,
                  width: mediaQuerySize.width,
                  height: mediaQuerySize.height,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Image.asset(
                      pathImage,
                      fit: BoxFit.cover,
                      height: mediaQuerySize.height,
                    ),
                  ),
                ),
                Container(
                  width: mediaQuerySize.width,
                  height: mediaQuerySize.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0.1, 0.8],
                    ),
                  ),
                ),
                VerticalListTeam(players: players),
                const CustomCircularProgressIndicator(),
                HorizontalListAgent(
                  agents: agents,
                  mediaQuerySize: mediaQuerySize,
                  changeImageBackground: (value) =>
                      _changeImageBackground(value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 24,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppTheme.colorCircularProgressBackground,
                  value: 1,
                  strokeWidth: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: Transform.rotate(
                  angle: math.pi * 0.48,
                  child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.linear,
                    tween: Tween<double>(begin: 0, end: 72 / 100),
                    builder: (context, value, _) {
                      return CircularProgressIndicator(
                        color: AppTheme.colorRed,
                        value: value,
                        strokeWidth: 2.0,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: Text(
                  '72',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.colorWhite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VerticalListTeam extends StatefulWidget {
  const VerticalListTeam({
    super.key,
    required this.players,
  });

  @override
  State<VerticalListTeam> createState() => _VerticalListTeamState();

  final List<Agent> players;

  void deselectPlayers() {
    for (var p in players) {
      p.selected = false;
    }
  }
}

class _VerticalListTeamState extends State<VerticalListTeam> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 1,
      ),
      child: Column(
        children: [
          const Text(
            'TEAM',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.colorTitle,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            direction: Axis.vertical,
            children: List.generate(
              5,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.deselectPlayers();
                      widget.players[index].selected =
                          !widget.players[index].selected;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: widget.players[index].selected ? 1 : 0,
                        color: widget.players[index].selected
                            ? AppTheme.colorBorderPrimary
                            : AppTheme.colorBorderSecondary,
                      ),
                    ),
                    child: Image.asset(
                      'images/${widget.players[index].image}',
                      width: 44,
                      height: 44,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListAgent extends StatefulWidget {
  const HorizontalListAgent({
    super.key,
    required this.agents,
    required this.mediaQuerySize,
    required this.changeImageBackground,
  });

  @override
  State<HorizontalListAgent> createState() => _HorizontalListAgentState();

  final List<Agent> agents;
  final Size mediaQuerySize;
  final void Function(String imgBackground) changeImageBackground;

  void deselectAgents() {
    for (var p in agents) {
      p.selected = false;
    }
  }
}

class _HorizontalListAgentState extends State<HorizontalListAgent> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 44,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            'images/select_your_agent.svg',
            color: AppTheme.colorWhite,
            fit: BoxFit.cover,
            width: 210,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: SizedBox(
              height: 88,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.agents.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.deselectAgents();
                        widget.agents[index].selected =
                            !widget.agents[index].selected;
                      });

                      widget.changeImageBackground(
                          widget.agents[index].imgBackground!);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 16,
                      ),
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: widget.agents[index].selected ? 2 : 0,
                          color: widget.agents[index].selected
                              ? AppTheme.colorRed
                              : AppTheme.colorBorderSecondary,
                        ),
                      ),
                      child: Image.asset(
                        'images/${widget.agents[index].image}',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 42,
              right: 42,
            ),
            child: ButtonPrimary(
              mediaQuerySize: widget.mediaQuerySize,
              text: 'LOCK IN',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
