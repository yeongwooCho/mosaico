import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  static String get routeName => "error";

  final String error;

  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: ListView(
        children: [
          Text('Error: $error'),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('홈으로 이동'),
          ),
        ],
      ),
    );
  }
}
