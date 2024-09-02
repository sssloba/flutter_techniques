import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/deboncer/debouncer.dart';
import 'package:flutter_techniques/widgets/app_scaffold.dart';

class DebouncerDemo extends StatefulWidget {
  const DebouncerDemo({super.key});

  @override
  State<DebouncerDemo> createState() => _DebouncerDemoState();
}

class _DebouncerDemoState extends State<DebouncerDemo> {
  final TextEditingController _textController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 600);
  String retainedValue = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Debouncer Demo',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 200.0,
          children: [
            TextField(
              controller: _textController,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: 'Type to see retained value by Debouncer',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  )),
              onChanged: (value) => _debouncer.run(
                () => setState(
                  () => retainedValue = value,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'This is retained value by Debouncer:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
              ),
            ),
            Text(
              retainedValue,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 153, 231, 156),
              ),
            )
          ],
        ),
      ),
    );
  }
}
