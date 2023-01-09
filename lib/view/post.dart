import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/getx/getxs.dart';

class PostScreen extends GetView<PostC> {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Retrofit'),
      ),
      body: const Center(
        child: TextButton(
        onPressed: () => controller.getPostData(),
        child: Text('Click Me'),
        ),
      ),
    );
  }
}
