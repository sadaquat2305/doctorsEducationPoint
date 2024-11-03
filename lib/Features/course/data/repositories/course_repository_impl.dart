// lib/feature/course/data/repositories/course_repository_impl.dart

import '../../domain/entities/course_entity.dart';
import '../../domain/repositories/course_repository.dart';
import '../data_sources/course_data_source.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseDataSourceImpl dataSource;

  CourseRepositoryImpl(this.dataSource);

  @override
  Future<List<Course>> getCourses() {
    return dataSource.fetchCourses();
  }
}
