// lib/feature/course/data/repositories/course_repository_impl.dart

import 'package:doctors_education_points/Features/course/data/data_sources/subject_data_source.dart';
import 'package:doctors_education_points/Features/course/domain/entities/subject_entity.dart';
import 'package:doctors_education_points/Features/course/domain/repositories/subject_repository.dart';

import '../../domain/entities/course_entity.dart';
import '../../domain/repositories/course_repository.dart';
import '../data_sources/course_data_source.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectDataSourceImpl dataSource;

  SubjectRepositoryImpl(this.dataSource);

  // @override
  // Future<List<SubjectEntity>> getSubjects() {
  //   return dataSource.fetchSubjects();
  // }

  @override
  Future<List<SubjectEntity>> getSubjectsByCourseId(String documentId) {
   return dataSource.getSubjectsByCourseId(documentId);
  }




}
