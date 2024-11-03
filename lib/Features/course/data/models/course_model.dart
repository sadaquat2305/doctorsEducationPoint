// lib/feature/course/data/models/course_model.dart

import '../../domain/entities/course_entity.dart';


class CourseModel extends Course {
  CourseModel({
    required String courseId,
    required String documentId,
    required String name,
    // required int totalLectures,
    // required List<ModuleModel> modules,
  }) : super(
    courseId: courseId,
    documentId: documentId,
    name: name,
    // totalLectures: totalLectures,
    // modules: modules,
  );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseId: json['courseId'],
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
      'courseId': courseId,
      'documentId': documentId,
      'name': name,
      // 'totalLectures': totalLectures,
      // 'modules': modules.map((module) => (module as ModuleModel).toJson()).toList(),
    };
  }
}
