import 'package:flutter/material.dart';
import 'package:ponsgymetre/main.dart';
import 'package:ponsgymetre/models.dart';

class CreateRoutine extends StatefulWidget {
  CreateRoutine({Key? key}) : super(key: key);

  @override
  State<CreateRoutine> createState() => _MyCreateRoutineState();
}

class _MyCreateRoutineState extends State<CreateRoutine> {
  Routine routine = Routine(name: "");

  final listKey = GlobalKey<AnimatedListState>();

  void setRoutineName(String routineName) {
    setState(() {
      routine.name = routineName;
    });
  }

  void setExerciseName(String exerciseName, int exerciseIndex) {
    setState(() => routine.exercises[exerciseIndex].name = exerciseName);
  }

  void addMuscularGroup(MuscularGroup muscularGroup, int exerciseIndex) {
    setState(() =>
        routine.exercises[exerciseIndex].muscularGroups.add(muscularGroup));
  }

  late Animation<double> animation;
  late AnimationController controller;

  Widget buildExercise(
      BuildContext context, int index, Animation<double> animation) {
    final ExerciseDef exercise;
    exercise = routine.exercises[index];
    return SizeTransition(
        sizeFactor: animation,
        child: Stack(children: [
          Card(
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            semanticContainer: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppColors.cardBackground,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        TextFormField(
                            decoration: InputDecoration(
                                hintText: "Exercise Name",
                                hintStyle: TextStyle(
                                    color: AppColors.primary, fontSize: 16.0)),
                            style: TextStyle(
                                color: AppColors.text, fontSize: 20.0),
                            initialValue: exercise.name,
                            onChanged: (name) => setExerciseName(name, index)),
                      ])),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        TextFormField(
                            decoration: InputDecoration(
                                hintText: "Muscular Group",
                                hintStyle: TextStyle(
                                    color: AppColors.primary, fontSize: 16.0)),
                            style: TextStyle(
                                color: AppColors.text, fontSize: 20.0),
                            onChanged: (name) => setExerciseName(name, index)),
                      ])),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 5,
            child: SizedBox(
                height: 30,
                child: FloatingActionButton(
                    onPressed: () {
                      setState(() => routine.exercises.removeAt(index));
                      listKey.currentState?.removeItem(index,
                          (context, animation) {
                        return SizeTransition(
                            sizeFactor: animation,
                            child: Stack(children: [Card()]));
                      });
                    },
                    backgroundColor: AppColors.primaryAccent,
                    child: const Icon(Icons.remove))),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Column(children: [
        // Routine name
        Card(
            margin: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
            semanticContainer: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppColors.cardBackground,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Routine Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                            fontSize: 16.0)),
                    TextFormField(
                        style: TextStyle(color: AppColors.text, fontSize: 20.0),
                        onChanged: (name) => setRoutineName(name)),
                  ]),
            )),
        // Add exercices
        Divider(
          color: AppColors.primaryAccent,
          thickness: 3.0,
        ),
        Expanded(child: AnimatedList(key: listKey, itemBuilder: buildExercise)),
      ]),
      Positioned(
          bottom: 25,
          right: 0,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    ExerciseDef exercise = ExerciseDef(
                        name: "", muscularGroups: {MuscularGroup.chest});
                    int lastIndex = routine.exercises.length;
                    setState(
                        () => routine.exercises.insert(lastIndex, exercise));
                    listKey.currentState?.insertItem(lastIndex);
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add),
                ),
              ))),
    ]);
  }
}
