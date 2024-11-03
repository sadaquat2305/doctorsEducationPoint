// lib/feature/course/domain/repositories/course_repository.dart


import 'package:doctors_education_points/Features/course/domain/entities/subject_entity.dart';

import '../entities/course_entity.dart';

abstract class SubjectRepository {
  Future<List<SubjectEntity>> getSubjects();
}

