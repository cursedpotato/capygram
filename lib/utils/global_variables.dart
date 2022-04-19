import 'package:capygram/screens/add_post_screen.dart';
import 'package:capygram/screens/feed_screen.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const Text('Search'),
  AddPostScreen(),
  const Text('Favorite'),
  const Text('Person')
];
