import 'package:flutter/material.dart';
import 'package:go_router_playground/router.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // router.go(const LoginRoute().location);
          // const LoginRoute().go(context);
        },
        child: const Text('Login'),
      ),
    );
  }
}
