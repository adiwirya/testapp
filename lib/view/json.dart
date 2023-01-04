import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/getx/getxs.dart';

class JsonScreen extends GetView<JsonC> {
  const JsonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title.value),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
