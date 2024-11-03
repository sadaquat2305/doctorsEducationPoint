// lib/feature/course/domain/repositories/course_repository.dart


import '../entities/course_entity.dart';

abstract class CourseRepository {
  Future<List<Course>> getCourses();
}


