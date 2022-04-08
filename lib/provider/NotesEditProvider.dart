import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/group.dart';

class NotesEditModel {
  String _title = '';
  String _description = '';
  int tag = 0;

  String get title => _title;
  String get description => _description;

  void onEditGroupTap(BuildContext context, int index) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');

    _title = box.getAt(index)!.title;
    _description = box.getAt(index)!.description;

    Navigator.of(context).pushNamed('/group/edit');
  }
}

class NotesEditProvider extends InheritedWidget {
  final NotesEditModel model;
  const NotesEditProvider({Key? key,required this.model, required Widget child}) : super(key: key, child: child);

  static NotesEditProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotesEditProvider>()
        ?.widget;
    return widget is NotesEditProvider ? widget : null;
  }

  static NotesEditProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotesEditProvider>();
  }

  @override
  bool updateShouldNotify(NotesEditProvider oldWidget) {
    return true;
  }
}