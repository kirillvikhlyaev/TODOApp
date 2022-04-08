import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add_new_group/add_new_group.dart';
import 'package:todo_app/widgets/edit_group/edit_group.dart';
import 'package:todo_app/widgets/group_page/group_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteIt',
      routes: {
        '/group': (context) => const GroupPageWidget(),
        '/group/addnew': (context) => const AddNewGroupWidget(),
        '/group/edit': (context) => const EditWidget(), 
      },
      initialRoute: '/group',
    );
  }
}
