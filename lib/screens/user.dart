import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // TODO: Show login page with modal
        },
        child: const Text('Login'),
      ),
    );
  }
}
