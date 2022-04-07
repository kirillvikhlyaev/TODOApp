import 'package:flutter/material.dart';
import 'package:todo_app/provider/NotesProvider.dart';

class AddNewGroupWidget extends StatefulWidget {
  const AddNewGroupWidget({Key? key}) : super(key: key);

  @override
  State<AddNewGroupWidget> createState() => _AddNewGroupWidgetState();
}

class _AddNewGroupWidgetState extends State<AddNewGroupWidget> {
  final _model = NotesProviderModel();
  @override
  Widget build(BuildContext context) {
    return NotesProvider(model: _model, child: AddNewGroupWidgetBody());
  }
}

class AddNewGroupWidgetBody extends StatelessWidget {
  const AddNewGroupWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить группу'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () => NotesProvider.read(context)?.model.save(context),
              icon: const Icon(Icons.done)),
        ],
      ),
      body: const _GroupFormWidget(),
    );
  }
}

class _GroupFormWidget extends StatelessWidget {
  const _GroupFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Название',
                  labelStyle: const TextStyle(color: Colors.grey)),
              autofocus: true,
              onChanged: (value) =>
                  NotesProvider.read(context)?.model.title = value,
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Описание',
                  labelStyle: const TextStyle(color: Colors.grey)),
              onChanged: (value) =>
                  NotesProvider.read(context)?.model.description = value,
            ),
          ],
        ),
      ),
    );
  }
}
