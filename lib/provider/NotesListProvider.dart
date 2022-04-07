import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/group.dart';

class NotesListModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  void onAddGroupTap(BuildContext context) {
    Navigator.of(context).pushNamed('/group/addnew');
  }
}

class NotesListProvider extends InheritedNotifier {
  final NotesListModel model;
  const NotesListProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static NotesListProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotesListProvider>()
        ?.widget;
    return widget is NotesListProvider ? widget : null;
  }

  static NotesListProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotesListProvider>();
  }
}
