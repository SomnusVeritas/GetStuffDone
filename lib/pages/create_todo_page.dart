import 'package:flutter/material.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});
  static const routeName = '/create';

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _title.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.save),
            )
          : null,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(label: Text('Title')),
              textInputAction: TextInputAction.next,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: (value) {
                if (value.isEmpty || (value.isNotEmpty && _title.isEmpty)) {
                  setState(() {
                    _title = value;
                  });
                } else {
                  _title = value;
                }
              },
            ),
            TextField(
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(label: Text('Description')),
              onChanged: (value) => _description = value,
            ),
          ],
        ),
      ),
    );
  }
}
