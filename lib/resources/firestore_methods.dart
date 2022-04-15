import 'dart:typed_data';

import 'package:capygram/models/post_model.dart';
import 'package:capygram/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreMehods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String profImage,
  ) async {
    String res = 'Some error occurred';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();

      PostModel post = PostModel(
        description: description,
        uid: uid,
        postId: postId,
        datePublished: DateTime.now(),
        profImage: profImage,
        likes: [],
        postUrl: photoUrl,
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());

      res = 'success';
    } catch (e) {
      res = "${e.toString()}";
    }
    return res;
  }
}
