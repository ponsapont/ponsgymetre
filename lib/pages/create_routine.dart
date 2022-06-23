import 'package:flutter/material.dart';
import 'package:ponsgymetre/models.dart';

class CreateRoutine extends StatefulWidget {
  CreateRoutine({Key? key}) : super(key: key);

  @override
  State<CreateRoutine> createState() => _MyCreateRoutineState();
}

class _MyCreateRoutineState extends State<CreateRoutine> {
  Routine routine = Routine(name: "");

  void setRoutineName(String routineName) {
    setState(() {
      routine.name = routineName;
    });
  }

  void addExercise() {
    setState(() => routine.exercises
        .add(ExerciseDef(name: "", muscularGroups: [MuscularGroup.chest])));
  }

  void setExerciseName(String exerciseName, int index) {
    setState(() => routine.exercises[index].name = exerciseName);
    print(routine.exercises[index].name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(children: [
      // Routine name
      Card(
          margin: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          semanticContainer: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.indigo.shade900,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Routine Name",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  TextFormField(
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                      onChanged: (name) => setRoutineName(name)),
                ]),
          )),
      // Add exercices
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              onPressed: addExercise,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          )),
      ...(routine.exercises
          .asMap()
          .entries
          .map((entry) => Card(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.indigo.shade900,
                child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Exercise Name",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                          TextFormField(
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                              onChanged: (name) =>
                                  setExerciseName(name, entry.key)),
                        ])),
              ))
          .toList())
    ])));
  }
}
