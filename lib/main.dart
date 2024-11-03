import 'package:doctors_education_points/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/course/data/data_sources/course_data_source.dart';
import 'Features/course/data/repositories/course_repository_impl.dart';
import 'Features/course/domain/use_cases/get_courses_use_case.dart';
import 'Features/course/presentation/blocs/course_bloc/course_bloc.dart';
import 'Features/course/presentation/blocs/course_bloc/course_event.dart';
import 'Features/course/presentation/pages/course_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [

      BlocProvider(create: (context){
        final dataSource = CourseDataSourceImpl();
        final repository = CourseRepositoryImpl(dataSource);
        final getCourseUseCase = GetCoursesUseCase(repository);
        return CourseBloc(getCourseUseCase);
      })
    ] ,
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: CoursePage()

    ));
  }

}