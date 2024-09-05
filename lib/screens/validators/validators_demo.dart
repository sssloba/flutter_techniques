import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/validators/validators.dart';
import 'package:flutter_techniques/widgets/app_scaffold.dart';

class ValidatorsDemo extends StatefulWidget {
  const ValidatorsDemo({super.key});

  @override
  State<ValidatorsDemo> createState() => _ValidatorsDemoState();
}

class _ValidatorsDemoState extends State<ValidatorsDemo> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordUnrestrictedTextController =
      TextEditingController();

  String retainedValue = '';

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passwordUnrestrictedTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Validators Demo',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 200.0,
          children: [
            // email validation
            TextFormField(
              controller: _emailTextController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
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
