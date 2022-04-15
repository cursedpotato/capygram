import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final String uid;
  final String postId;
  final DateTime datePublished;
  final String profImage;
  final List likes;
  final String postUrl;

  const PostModel({
    required this.description,
    required this.uid,

    required this.postId,
    required this.datePublished,
    required this.profImage,
    required this.likes,
    required this.postUrl,
  });

  Map<String, dynamic> toJson() => {
        "description": postId,
        "uid": uid,

        "postId": postId,
        "datePublished": datePublished,
        "profImage": profImage,
        "likes": likes,
        "postUrl": postUrl,
      };

  static PostModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
      description: snapshot['postId'],
      uid: snapshot['uid'],
      
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
      postUrl: snapshot['postUrl'],
    );
  }
}
