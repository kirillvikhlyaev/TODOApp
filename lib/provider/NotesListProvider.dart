import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/group.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesListModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  NotesListModel() {
    _loadData();
  }

  void onAddGroupTap(BuildContext context) {
    Navigator.of(context).pushNamed('/group/addnew');
  }

  void deleteGroup(int index) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    await box.deleteAt(index);
  }

  void _loadData() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');

    _groups = box.values.toList();
    print(_groups);
    notifyListeners();
    box.listenable().addListener(() {
      _groups = box.values.toList();
      notifyListeners();
    });
  }
}

class NotesListProvider extends InheritedNotifier {
  final NotesListModel model;
  const NotesListProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, notifier: model, child: child);

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
