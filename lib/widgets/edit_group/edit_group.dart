import 'package:flutter/material.dart';
import 'package:todo_app/provider/NotesEditProvider.dart';

class EditWidget  extends StatefulWidget {
  const EditWidget ({ Key? key }) : super(key: key);

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  final _model = NotesEditModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Редактирование группы'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.done))],
      ),
      body: NotesEditProvider(model: _model,
      child: _GroupEditFormWidget(),),
    );
  }
}

class _GroupEditFormWidget extends StatefulWidget {
  const _GroupEditFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_GroupEditFormWidget> createState() => _GroupEditFormWidgetState();
}

class _GroupEditFormWidgetState extends State<_GroupEditFormWidget> {
  String dropDownValue = 'Один';
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: NotesEditProvider.read(context)?.model.title);
    final descriptionController = TextEditingController(text: NotesEditProvider.read(context)?.model.description);
  
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Название',
                  labelStyle: const TextStyle(color: Colors.grey)),
              autofocus: true,
              
              onChanged: (value) => {},
            ),
            const SizedBox(height: 15),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Описание',
                  labelStyle: const TextStyle(color: Colors.grey)),
              onChanged: (value) => {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Тэг:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                DropdownButton(
                  value: dropDownValue,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                  items:<String>['Один', 'Два', 'Три']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
                )
              ],
            )
          ]
      ),
    ),);
  }
  }