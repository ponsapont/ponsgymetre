import 'package:flutter/material.dart';
import 'package:ponsgymetre/main.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: cards
            .map(
              (card) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: AppColors.cardBackground,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, card["route"]),
                  splashColor: AppColors.primary,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(card["icon"], color: AppColors.text, size: 50),
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
