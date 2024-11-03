// lib/feature/course/presentation/pages/course_page.dart

import 'package:doctors_education_points/Features/course/domain/use_cases/get_subject_use_case.dart';
import 'package:doctors_education_points/Features/course/presentation/blocs/subject_bloc/subject_bloc.dart';
import 'package:doctors_education_points/Features/course/presentation/blocs/subject_bloc/subject_event.dart';
import 'package:doctors_education_points/Features/course/presentation/blocs/subject_bloc/subject_state.dart'; // Import SubjectState
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/course_bloc/course_bloc.dart';
import '../blocs/course_bloc/course_event.dart';
import '../blocs/course_bloc/course_state.dart';
import 'subject_page.dart'; // Import SubjectPage

class SubjectPage extends StatelessWidget {

  final String documentId;

  SubjectPage( {required this.documentId} );
  @override
  Widget build(BuildContext context) {
    // Trigger the fetch event when the page loads
    context.read<SubjectBloc>().add(FetchSubjectsEvent(documentId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: BlocBuilder<SubjectBloc, SubjectState>( // Use SubjectState here
        builder: (context, state) {
          if (state is SubjectLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SubjectError) {
            return Center(child: Text(state.message));
          } else if (state is SubjectLoaded) {
            return ListView.builder(
              itemCount: state.subjects.length,
              itemBuilder: (context, index) {
                final subject = state.subjects[index];

                return ListTile(

                  title: Text(subject.name),
                  subtitle: Text(subject.documentId),
                  onTap: () {
                    // Navigate to SubjectPage with the course ID
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => SubjectPage(courseId: subject.documentId),
                    //   ),
                    // );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
