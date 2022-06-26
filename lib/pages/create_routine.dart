import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ponsgymetre/main.dart';
import 'package:ponsgymetre/models.dart';

class CreateRoutine extends StatefulWidget {
  const CreateRoutine({Key? key}) : super(key: key);

  @override
  State<CreateRoutine> createState() => _MyCreateRoutineState();
}

class _MyCreateRoutineState extends State<CreateRoutine> {
  Routine routine = Routine(name: "");
  bool loading = false;

  final listKey = GlobalKey<AnimatedListState>();

  void setRoutineName(String routineName) {
    setState(() {
      routine.name = routineName;
    });
  }

  void setExerciseName(String exerciseName, int exerciseIndex) {
    setState(() => routine.exercises[exerciseIndex].name = exerciseName);
  }

  void setMuscularGroup(MuscularGroup muscularGroup, int exerciseIndex) {
    setState(
        () => routine.exercises[exerciseIndex].setMuscularGroup(muscularGroup));
  }

  void setLoading(bool loading) {
    setState(() => this.loading = loading);
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
                  const SizedBox(width: 20),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        DropdownButton<MuscularGroup>(
                            dropdownColor: AppColors.background,
                            value: exercise.muscularGroup,
                            items: MuscularGroup.values.map((value) {
                              return DropdownMenuItem<MuscularGroup>(
                                value: value,
                                child: Text(muscularGroupString(value)),
                              );
                            }).toList(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                            onChanged: (MuscularGroup? muscularGroup) =>
                                setMuscularGroup(
                                    muscularGroup ?? MuscularGroup.chest,
                                    index))
                      ]))
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
                    heroTag: null,
                    onPressed: () {
                      setState(() => routine.exercises.removeAt(index));
                      listKey.currentState?.removeItem(index,
                          (context, animation) {
                        return SizeTransition(
                            sizeFactor: animation,
                            child: Stack(children: const [Card()]));
                      });
                    },
                    backgroundColor: AppColors.primaryAccent,
                    child: const Icon(Icons.remove))),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference routines =
        FirebaseFirestore.instance.collection('routines');

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

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
                  heroTag: null,
                  onPressed: () {
                    ExerciseDef exercise = ExerciseDef(
                        name: "", muscularGroup: MuscularGroup.chest);
                    int lastIndex = routine.exercises.length;
                    setState(
                        () => routine.exercises.insert(lastIndex, exercise));
                    listKey.currentState?.insertItem(lastIndex);
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add),
                ),
              ))),
      Positioned(
          bottom: 95,
          right: 0,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      // Go back to home
                      routines.add(routine.toJson()).then((value) {
                        setLoading(false);
                        Navigator.pop(context);
                      });
                      setLoading(true);
                    },
                    backgroundColor: AppColors.secondary,
                    child: const Icon(
                      Icons.check,
                    ),
                  )))),
    ]);
  }
}
