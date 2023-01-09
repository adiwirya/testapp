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
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.getPostData(),
          child: const Text('Post Retrofit'),
        ),
      ),
    );
  }
}
