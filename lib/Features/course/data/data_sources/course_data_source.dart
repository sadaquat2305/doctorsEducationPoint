// lib/feature/course/data/data_sources/course_data_source.dart


import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/course_entity.dart';

class CourseDataSourceImpl {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;



  Future<List<Course>> fetchCourses() async {
    final querySnapshot = await firestore.collection('courses').get();
    return querySnapshot.docs.map((doc) {
      return Course(
        courseId: doc['courseId'],
        documentId: doc['documentId'],
        name: doc['name'],

        // modules: [], // Fetch and map modules if needed
      );
    }).toList();
  }
}
