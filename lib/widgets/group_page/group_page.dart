import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/provider/NotesListProvider.dart';

class GroupPageWidget extends StatefulWidget {
  const GroupPageWidget({Key? key}) : super(key: key);

  @override
  State<GroupPageWidget> createState() => _GroupPageWidgetState();
}

class _GroupPageWidgetState extends State<GroupPageWidget> {
  final _model = NotesListModel();
  @override
  Widget build(BuildContext context) {
    return NotesListProvider(model: _model, child: GroupListBody());
  }
}

class GroupListBody extends StatelessWidget {
  const GroupListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotetIt'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Color.fromARGB(31, 214, 214, 214),
        child: GroupListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            NotesListProvider.read(context)?.model.onAddGroupTap(context),
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

class GroupListWidget extends StatefulWidget {
  const GroupListWidget({Key? key}) : super(key: key);

  @override
  State<GroupListWidget> createState() => _GroupListWidgetState();
}

class _GroupListWidgetState extends State<GroupListWidget> {
  @override
  Widget build(BuildContext context) {
    final groupsCount =
        NotesListProvider.watch(context)?.model.groups.length ?? 0;
    print("Данные получены");
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GroupItemWidjet(indexInList: index);
      },
      itemCount: groupsCount,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 5,
        );
      },
    );
  }
}

class GroupItemWidjet extends StatelessWidget {
  final int indexInList;
  const GroupItemWidjet({Key? key, required this.indexInList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = NotesListProvider.read(context)!.model;
    final group = model.groups[indexInList];
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) => () {},
            backgroundColor: Colors.black12,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) => model.deleteGroup(indexInList),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          title: Text(group.title),
          subtitle: Text(group.description),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle),
            ],
          ),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
      ),
    );
  }
}
