import 'dart:typed_data';

import 'package:capygram/models/post_model.dart';
import 'package:capygram/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreMehods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadPost({
    required String description,
    required Uint8List file,
    required String uid,
    required String profImage,
    required String username,
  }) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      PostModel post = PostModel(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      }
      else{
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        }); 
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> postComment(String postId, String text, String uid, String name, String profilePic) async{
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore.collection("posts").doc(postId).collection('comments').doc(commentId).set({
          'profilePic' : profilePic,
          'name' : name,
          'uid' : uid,
          'text' : text,
          'commentId' : commentId,
          'datePublished' : DateTime.now()
        });
      }
      else{
        print('text is empty');
      }
    } catch (e) {
      print(e.toString());
    }

  }

  Future<void> deletePost(String postId)async{
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

}
