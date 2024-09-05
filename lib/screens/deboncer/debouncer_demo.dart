import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/deboncer/debouncer.dart';
import 'package:flutter_techniques/utils/validators.dart';
import 'package:flutter_techniques/widgets/app_scaffold.dart';

class DebouncerDemo extends StatefulWidget {
  const DebouncerDemo({super.key});

  @override
  State<DebouncerDemo> createState() => _DebouncerDemoState();
}

class _DebouncerDemoState extends State<DebouncerDemo> {
  //final formKey = GlobalKey<FormState>();
  final TextEditingController _debounceDemoTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordUnrestrictedTextController =
      TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 600);

  String retainedValue = '';

  @override
  void dispose() {
    _debounceDemoTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passwordUnrestrictedTextController.dispose();
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
            // debouncer demo
            TextField(
              controller: _debounceDemoTextController,
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
            ),

            // email validation
            TextFormField(
              controller: _emailTextController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //key: formKey,
              decoration: const InputDecoration(
                hintText: 'Type some email to see validation',
                hintStyle: TextStyle(
                  color: Colors.black26,
                ),
                errorText: 'Email field is reqired *',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email cannot be empty';
                }
                final bool isEmail = Validators().isEmail(value);
                return isEmail ? 'Email form is ok' : 'Invalid email form';
              },
            ),

            // password validation
            TextFormField(
              controller: _passwordTextController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText:
                      'Type password. Some symbols like +,-,/ etc. are not allowed.',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                  errorText:
                      'Password field is reqired *. Some symbols like +,-,/ etc. are not allowed.',
                  errorMaxLines: 2),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Password cannot be empty *.';
                }
                final bool isSymbolAllowed =
                    Validators().isSymbolAllowed(value);
                if (!isSymbolAllowed) {
                  return 'Used symbol which is not allowed ❌';
                }
                final bool isStrongPassword =
                    Validators().strongPassword(value);
                return isStrongPassword
                    ? 'Password is strong!!! 😎'
                    : 'Password is week ☹';
              },
            ),

            // unrestricted password validation
            TextFormField(
              controller: _passwordUnrestrictedTextController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: 'Type password. All symbols are allowed.',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                  errorText:
                      'Password field is reqired *. All symbols are allowed.',
                  errorMaxLines: 2),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Password cannot be empty *.';
                }
                final bool isStrongPassword =
                    Validators().strongPasswordUnrestricted(value);
                return isStrongPassword
                    ? 'Password is strong!!! 😎'
                    : 'Password is week ☹';
              },
            ),
          ],
        ),
      ),
    );
  }
}
