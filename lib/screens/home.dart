import 'package:flutter/material.dart';
import 'package:flutterbloglearn/services/blog_post_service.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BlogPostService _blogPostService = BlogPostService();

  _getAllBlogPost() async{
    var result = await _blogPostService.getAllBlogPost();
    print(result.body);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllBlogPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: Center(child: Text('Welcome to blog app'),),
    );
  }
}
