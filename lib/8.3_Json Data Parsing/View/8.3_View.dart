
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/8.3_Provider.dart';


class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostProvider postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        scrolledUnderElevation: 0.1,
        title: const Text(
          'Post Json Data',
          style: TextStyle(
            letterSpacing: 0.3,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: postProvider.postModal.posts.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text(
            postProvider.postModal.posts[index].id.toString(),
            style: const TextStyle(fontSize: 15),
          ),
          title: Text(
            postProvider.postModal.posts[index].title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'Views : ${postProvider.postModal.posts[index].views.toString()}',
            style: const TextStyle(fontSize: 14),
          ),
          trailing: Text(
            postProvider.postModal.posts[index].reaction.likes.toString(),
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}