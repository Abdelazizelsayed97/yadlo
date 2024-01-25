import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yadlo/features/posts/data/model/Postsmodel.dart';

import '../../domain/entities /posts.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            post.image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  post.body,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// For date formatting

class PostWidget2 extends StatelessWidget {
  final Posts posts;

  const PostWidget2({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(posts.profilePictureUrl),
            ),
            title: Text(posts.username),
            subtitle: Text(DateFormat.yMMMd().format(posts.postDate)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              posts.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (posts.contentImageURL.isNotEmpty)
            Image.network(
              posts.contentImageURL,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${posts.likes} Likes'),
                Text('${posts.awards} Awards'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: Text(
              'Location: ${posts.location}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
