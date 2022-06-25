/// Model for representing a routine definition
class Routine {
  Routine({required this.name});

  String name;
  List<ExerciseDef> exercises = [];

  void setName(String name) {
    this.name = name;
  }

  void addExercise(ExerciseDef exercise) {
    exercises.add(exercise);
  }

  @override
  String toString() {
    return "Routine { name: \"$name\", exercises: $exercises }";
  }
}

/// Model for the exercise definitions
class ExerciseDef {
  ExerciseDef({required this.name, required this.muscularGroups});

  String name;
  Set<MuscularGroup> muscularGroups;

  void setMuscularGroups(Set<MuscularGroup> muscularGroups) {
    this.muscularGroups = muscularGroups;
  }

  void setName(String name) {
    this.name = name;
  }

  @override
  String toString() {
    return "ExerciseDef { name: \"$name\", muscularGroups: $muscularGroups }";
  }
}

/// Identified muscular groups
enum MuscularGroup {
  biceps,
  triceps,
  shoulder,
  chest,
  back,
  lowerBack,
  core,
  quadriceps,
  isquios,
  calfs,
}

/// Model for workout. The actual instance of a routine.
class Workout {
  Workout({required this.routine});

  Routine routine;
  bool completed = false;
  List<WorkoutExercise> exercises = [];

  void addExercise(WorkoutExercise exercise) {
    exercises.add(exercise);
  }

  void setCompleted(bool completed) {
    this.completed = completed;
  }
}

/// Model for workout exercise. Actual record populated during a workout
class WorkoutExercise {
  WorkoutExercise(
      {required this.exerciseDef,
      required this.repetitions,
      required this.weight});

  ExerciseDef exerciseDef;
  int repetitions;
  int weight;
}
