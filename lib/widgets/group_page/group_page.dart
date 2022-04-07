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

class GroupListWidget extends StatelessWidget {
  const GroupListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        NotesListProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GroupItemWidjet();
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
  const GroupItemWidjet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: (context) => () {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: const ColoredBox(
        color: Colors.white,
        child: ListTile(
          title: Text('Some text'),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
      ),
    );
  }
}
