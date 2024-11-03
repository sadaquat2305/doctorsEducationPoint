// lib/feature/course/presentation/blocs/subject_bloc/subject_bloc.dart

import 'package:doctors_education_points/Features/course/domain/use_cases/get_subject_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'subject_event.dart';
import 'subject_state.dart';
import '../../../domain/repositories/subject_repository.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final GetSubjectUseCase getSubjectUseCase;

  SubjectBloc(this.getSubjectUseCase) : super(SubjectLoading()) {
    on<FetchSubjectsEvent>((event, emit) async {
      emit(SubjectLoading());

      try {
        print("................${event.documentId}");
        final subjects = await getSubjectUseCase.call(event.documentId);
        emit(SubjectLoaded(subjects));
      } catch (e) {
        emit(SubjectError(e.toString()));
      }
    });
  }
}
