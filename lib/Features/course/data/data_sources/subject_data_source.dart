// lib/feature/course/data/data_sources/course_data_source.dart


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_education_points/Features/course/domain/entities/subject_entity.dart';



class SubjectDataSourceImpl {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;






  Future<List<SubjectEntity>> getSubjectsByCourseId(  String documentId ) async {
    final querySnapshot = await firestore.collection('courses')
        .doc(documentId).collection('subjects').get(); // courseId is dynamic
    return querySnapshot.docs.map((doc) {
      return SubjectEntity(
        subjectId: doc['subjectId'],
        documentId: doc['documentId'],
        name: doc['name'],

        // modules: [], // Fetch and map modules if needed
      );
    }).toList();
  }
}
