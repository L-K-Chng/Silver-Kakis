import 'package:flutter/material.dart';
import '../screens/add_post_screen.dart';
import '../screens/social_feed_screen.dart';
import '../screens/profile_page.dart';
import '../screens/interest_group_page.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const InterestGroupPage(),
  const AddPostScreen(),
  const ProfilePage(),
];