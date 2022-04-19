import 'package:capygram/utils/colors.dart';
import 'package:capygram/widgets/comment_card.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://image.shutterstock.com/image-illustration/grungy-painted-wood-texture-background-600w-262857968.jpg'),
              radius: 18,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Comment as a user',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: const Text('Post', style: TextStyle(color: blueColor),),
              ),
            )
          ],
        ),
      )),
    );
  }
}
