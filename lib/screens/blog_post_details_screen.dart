import 'package:flutter/material.dart';
import 'package:flutterbloglearn/models/blog_post.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';

class BlogPostDetailsScreen extends StatefulWidget {
  final BlogPost blogPost;
  BlogPostDetailsScreen({this.blogPost});
  @override
  _BlogPostDetailsScreesState createState() => _BlogPostDetailsScreesState();
}

class _BlogPostDetailsScreesState extends State<BlogPostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.blogPost.title),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.network('https://blog.chea.me/'+this.widget.blogPost.featureImageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(this.widget.blogPost.title),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(DateFormat("dd-MMM-yyyy").format(DateTime.parse(this.widget.blogPost.createdAt)),style: TextStyle(backgroundColor: Colors.black12,fontSize: 16.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Html(data:this.widget.blogPost.details),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
