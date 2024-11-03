// lib/feature/course/domain/use_cases/get_courses_use_case.dart

import '../../data/repositories/course_repository_impl.dart';
import '../entities/course_entity.dart';

class GetCoursesUseCase {
  final CourseRepositoryImpl repository;

  GetCoursesUseCase(this.repository);

  Future<List<Course>> call() {
    return repository.getCourses();
  }
}
