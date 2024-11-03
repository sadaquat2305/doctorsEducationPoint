// lib/feature/course/presentation/pages/course_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/course_bloc/course_bloc.dart';
import '../blocs/course_bloc/course_event.dart';
import '../blocs/course_bloc/course_state.dart';
import 'subject_page.dart'; // Import SubjectPage

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Trigger the fetch event when the page loads
    context.read<CourseBloc>().add(FetchCoursesEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text(state.error!));
          } else {
            return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                final course = state.courses[index];
                return ListTile(
                  title: Text(course.name),
                  subtitle: Text(course.documentId),
                  onTap: () {
                    print('courseId ${course.courseId} documentId ${course.documentId}');
                    // Navigate to SubjectPage with the course ID
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SubjectPage(documentId: course.documentId,),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
