import 'package:flutter_valorant/models/agent.dart';

class TeamRepository {
  static List<Agent> players = [
    Agent(image: 'player1.png', selected: false),
    Agent(image: 'player2.png', selected: true),
    Agent(image: 'player3.png', selected: false),
    Agent(image: 'player4.png', selected: false),
    Agent(image: 'player5.png', selected: false),
  ];
}
