// lib/feature/course/domain/use_cases/get_courses_use_case.dart

import 'package:doctors_education_points/Features/course/domain/entities/subject_entity.dart';
import 'package:doctors_education_points/Features/course/domain/repositories/subject_repository.dart';



class GetSubjectUseCase {
  final SubjectRepository repository;

  GetSubjectUseCase(this.repository);

  Future<List<SubjectEntity>> call( String documentId ) {
    return repository.getSubjectsByCourseId(documentId);
  }

}
