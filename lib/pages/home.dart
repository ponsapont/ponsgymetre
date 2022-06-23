import 'package:flutter/material.dart';

const List<dynamic> cards = [
  {
    "title": "New Routine",
    "route": "/create_routine",
    "icon": Icons.fitness_center,
  },
  {
    "title": "List Routines",
    "route": "/list",
    "icon": Icons.list,
  },
  {
    "title": "History",
    "route": "/history",
    "icon": Icons.history,
  },
  {
    "title": "Statistics",
    "route": "/statistics",
    "icon": Icons.auto_graph,
  },
  {
    "title": "Start Workout",
    "route": "/start",
    "icon": Icons.flash_on,
  },
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: cards
            .map(
              (card) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.indigo.shade900,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, card["route"]),
                  splashColor: Colors.blue.withAlpha(30),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(card["icon"],
                              color: Colors.grey.shade200, size: 50),
                          Text(
                            card["title"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ]),
                  ),
                ),
              ),
            )
            .toList());
  }
}
