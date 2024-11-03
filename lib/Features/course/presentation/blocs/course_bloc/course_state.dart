// lib/feature/course/presentation/blocs/course_state.dart



import '../../../domain/entities/course_entity.dart';

class CourseState {
  final List<Course> courses;
  final bool isLoading;
  final String? error;

  CourseState({
    this.courses = const [],
    this.isLoading = false,
    this.error,
  });

  CourseState copyWith({
    List<Course>? courses,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
