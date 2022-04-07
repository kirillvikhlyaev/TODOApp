import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/group.dart';

class NotesProviderModel {
  String title = '';
  String description = '';
  int tag = 0;

  void save(BuildContext context) async {
    if (title.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final group = Group(title: title, description: description, tag: tag);
    await box.add(group);
    Navigator.pop(context);
  }
}

class NotesProvider extends InheritedWidget {
  final NotesProviderModel model;
  const NotesProvider({Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static NotesProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotesProvider>()
        ?.widget;
    return widget is NotesProvider ? widget : null;
  }

  static NotesProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotesProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
