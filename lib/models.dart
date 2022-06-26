import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

/// Model for representing a routine definition
@JsonSerializable()
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

  factory Routine.fromJson(Map<String, dynamic> json) =>
      _$RoutineFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineToJson(this);

  @override
  String toString() {
    return "Routine { name: \"$name\", exercises: $exercises }";
  }
}

/// Model for the exercise definitions
@JsonSerializable()
class ExerciseDef {
  ExerciseDef({required this.name, required this.muscularGroup});

  String name;
  MuscularGroup muscularGroup;

  void setMuscularGroup(MuscularGroup muscularGroup) {
    this.muscularGroup = muscularGroup;
  }

  void setName(String name) {
    this.name = name;
  }

  factory ExerciseDef.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDefFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseDefToJson(this);

  @override
  String toString() {
    return "ExerciseDef { name: \"$name\", muscularGroups: $muscularGroup }";
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

String muscularGroupString(MuscularGroup muscularGroup) {
  switch (muscularGroup) {
    case MuscularGroup.biceps:
      return "Biceps";
    case MuscularGroup.triceps:
      return "Triceps";
    case MuscularGroup.shoulder:
      return "Shoulder";
    case MuscularGroup.chest:
      return "Chest";
    case MuscularGroup.back:
      return "Back";
    case MuscularGroup.lowerBack:
      return "Lower Back";
    case MuscularGroup.core:
      return "Core";
    case MuscularGroup.quadriceps:
      return "Quadriceps";
    case MuscularGroup.isquios:
      return "Isquios";
    case MuscularGroup.calfs:
      return "Calfs";
    default:
      return "";
  }
}

/// Model for workout. The actual instance of a routine.
@JsonSerializable()
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

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

/// Model for workout exercise. Actual record populated during a workout
@JsonSerializable()
class WorkoutExercise {
  WorkoutExercise(
      {required this.exerciseDef,
      required this.repetitions,
      required this.weight});

  ExerciseDef exerciseDef;
  int repetitions;
  int weight;

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutExerciseToJson(this);
}
