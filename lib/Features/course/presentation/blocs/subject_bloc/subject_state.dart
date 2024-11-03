// lib/feature/course/presentation/blocs/subject_bloc/subject_state.dart


import 'package:doctors_education_points/Features/course/domain/entities/subject_entity.dart';

abstract class SubjectState {

}

class SubjectLoading extends SubjectState {}

class SubjectLoaded extends SubjectState {
  final List<SubjectEntity> subjects;

  SubjectLoaded(this.subjects);


}

class SubjectError extends SubjectState {
  final String message;

  SubjectError(this.message);


}
