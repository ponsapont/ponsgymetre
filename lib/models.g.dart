// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map<String, dynamic> json) => Routine(
      name: json['name'] as String,
    )..exercises = (json['exercises'] as List<dynamic>)
        .map((e) => ExerciseDef.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises,
    };

ExerciseDef _$ExerciseDefFromJson(Map<String, dynamic> json) => ExerciseDef(
      name: json['name'] as String,
      muscularGroup: $enumDecode(_$MuscularGroupEnumMap, json['muscularGroup']),
    );

Map<String, dynamic> _$ExerciseDefToJson(ExerciseDef instance) =>
    <String, dynamic>{
      'name': instance.name,
      'muscularGroup': _$MuscularGroupEnumMap[instance.muscularGroup],
    };

const _$MuscularGroupEnumMap = {
  MuscularGroup.biceps: 'biceps',
  MuscularGroup.triceps: 'triceps',
  MuscularGroup.shoulder: 'shoulder',
  MuscularGroup.chest: 'chest',
  MuscularGroup.back: 'back',
  MuscularGroup.lowerBack: 'lowerBack',
  MuscularGroup.core: 'core',
  MuscularGroup.quadriceps: 'quadriceps',
  MuscularGroup.isquios: 'isquios',
  MuscularGroup.calfs: 'calfs',
};

Workout _$WorkoutFromJson(Map<String, dynamic> json) => Workout(
      routine: Routine.fromJson(json['routine'] as Map<String, dynamic>),
    )
      ..completed = json['completed'] as bool
      ..exercises = (json['exercises'] as List<dynamic>)
          .map((e) => WorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'routine': instance.routine,
      'completed': instance.completed,
      'exercises': instance.exercises,
    };

WorkoutExercise _$WorkoutExerciseFromJson(Map<String, dynamic> json) =>
    WorkoutExercise(
      exerciseDef:
          ExerciseDef.fromJson(json['exerciseDef'] as Map<String, dynamic>),
      repetitions: json['repetitions'] as int,
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$WorkoutExerciseToJson(WorkoutExercise instance) =>
    <String, dynamic>{
      'exerciseDef': instance.exerciseDef,
      'repetitions': instance.repetitions,
      'weight': instance.weight,
    };
