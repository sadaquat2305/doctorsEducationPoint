// lib/feature/course/data/models/course_model.dart

import 'package:doctors_education_points/Features/course/domain/entities/subject_entity.dart';

import '../../domain/entities/course_entity.dart';


class SubjectModel extends SubjectEntity {
  SubjectModel({
    required String subjectId,
    required String documentId,
    required String name,
    // required int totalLectures,
    // required List<ModuleModel> modules,
  }) : super(
    subjectId: subjectId,
    documentId: documentId,
    name: name,
    // totalLectures: totalLectures,
    // modules: modules,
  );

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectId: json['subjectId'],
      documentId: json['documentId'],
      name: json['name'],
      // totalLectures: json['totalLectures'],
      // modules: (json['modules'] as List)
      //     .map((module) => ModuleModel.fromJson(module))
      //     .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectId,
      'documentId': documentId,
      'name': name,
      // 'totalLectures': totalLectures,
      // 'modules': modules.map((module) => (module as ModuleModel).toJson()).toList(),
    };
  }
}
