import 'package:flutter_valorant/models/agent.dart';
import 'package:flutter_valorant/models/match.dart';

class AgentRepository {
  static List<Agent> agents = [
    Agent(
      image: 'thumb_viper.png',
      selected: true,
      imgBackground: 'viper.png',
    ),
    Agent(
      image: 'thumb_jett.png',
      selected: false,
      imgBackground: 'jett.png',
    ),
    Agent(
      image: 'thumb_astra.png',
      selected: false,
      imgBackground: 'astra.png',
    ),
    Agent(
      image: 'thumb_neon.png',
      selected: false,
      imgBackground: 'neon.png',
    ),
    Agent(
      image: 'thumb_raze.png',
      selected: false,
      imgBackground: 'raze.png',
    ),
    Agent(
      image: 'thumb_brim.png',
      selected: false,
      imgBackground: 'brims.png',
    ),
    Agent(
      image: 'thumb_breach.png',
      selected: false,
      imgBackground: 'breach.png',
    ),
    Agent(
      image: 'thumb_phoenix.png',
      selected: false,
      imgBackground: 'phoenix.png',
    ),
    Agent(
      image: 'thumb_killjoy.png',
      selected: false,
      imgBackground: 'killjoy.png',
    ),
  ];

  static List<PlayerMatch> matchs = [
    PlayerMatch(kDA: '20/1/9', score: 10.950, victory: '12/1'),
    PlayerMatch(kDA: '15/1/8', score: 8.950, victory: '10/1'),
    PlayerMatch(kDA: '12/1/7', score: 5.950, victory: '8/1'),
    PlayerMatch(kDA: '10/1/7', score: 5.950, victory: '6/1'),
    PlayerMatch(kDA: '8/1/7', score: 5.950, victory: '4/1'),
  ];
}
