import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_playground/router.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(rootRouterProvider);
    return Center(
      child: TextButton(
        onPressed: () {
          router.push(const LoginRoute().location);
        },
        child: const Text('Login'),
      ),
    );
  }
}
