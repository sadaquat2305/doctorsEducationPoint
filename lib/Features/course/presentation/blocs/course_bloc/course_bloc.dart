// lib/feature/course/presentation/blocs/course_bloc/course_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/get_courses_use_case.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUseCase getCoursesUseCase;

  CourseBloc(this.getCoursesUseCase) : super(CourseState()) {
    on<FetchCoursesEvent>(_onFetchCourses);
  }

  Future<void> _onFetchCourses(FetchCoursesEvent event, Emitter<CourseState> emit) async {
    emit(CourseState(isLoading: true));
    try {
      final courses = await getCoursesUseCase();
      emit(CourseState(courses: courses));
    } catch (e) {
      emit(CourseState(error: e.toString()));
    }
  }
}
