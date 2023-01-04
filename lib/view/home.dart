// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/getx/getxs.dart';
import 'package:testapp/routes/app_routes.dart';

class HomeScreen extends GetView<HomeViewC> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title.value),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: () => Get.toNamed(Routes.jsonScreen),
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.toString(),
            style: const TextStyle(color: Colors.indigo, fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: controller.decrement,
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: controller.increment,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
