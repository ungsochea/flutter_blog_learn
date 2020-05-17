import 'package:flutter/material.dart';
import 'package:flutterbloglearn/services/blog_post_service.dart';
import 'package:flutterbloglearn/models/blog_post.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BlogPostService _blogPostService = BlogPostService();

  Future<List<BlogPost>> _getAllBlogPost() async{
    var result = await _blogPostService.getAllBlogPost();
//    print(result.body);
    List<BlogPost> _list = List<BlogPost>();
    if(result != null){
      var blogPosts = json.decode(result.body);
      blogPosts.forEach((blogPost){
        var model = BlogPost();
        model.title = blogPost['title'];
        model.details = blogPost['title'];
        model.featureImageUrl = blogPost['featured_image_url'];
        model.category = blogPost['category']['name'];
        model.createdAt = blogPost['created_at'];
        _list.add(model);
      });
    }
    return _list;
  }

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _getAllBlogPost();
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: FutureBuilder<List<BlogPost>>(
        future: _getAllBlogPost(),
        builder: (BuildContext context,AsyncSnapshot<List<BlogPost>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                return Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network('https://blog.chea.me/'+snapshot.data[index].featureImageUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(snapshot.data[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(snapshot.data[index].category,style: TextStyle(backgroundColor: Colors.black12,fontSize: 16),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(DateFormat("dd-MMM-yyyy").format(DateTime.parse(snapshot.data[index].createdAt)),style: TextStyle(backgroundColor: Colors.black12,fontSize: 16.0),),
                          )
                        ],
                      ),
                  ],
                  ),
                ),
                );
                }
            );
          }else{
            return Container(child: Text('Loading ...'),);
          }
        },
      ),
    );
  }
}
