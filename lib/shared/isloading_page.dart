// ignore_for_file: file_names
import 'package:flutter/material.dart';

class IsLoadingPage extends StatelessWidget {
  const IsLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
