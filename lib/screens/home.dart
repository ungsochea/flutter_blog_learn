import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getAllBlogPost() async{
    var result = await http.get('https://blog.chea.me/api/posts');
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
