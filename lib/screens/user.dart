import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).push('/login');
        },
        child: const Text('Login'),
      ),
    );
  }
}
