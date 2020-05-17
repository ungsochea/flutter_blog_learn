import 'package:flutterbloglearn/repository/repository.dart';
class BlogPostService{

  Repository _repository;

  BlogPostService(){
    _repository = Repository();
  }

  getAllBlogPost() async{
  return await  _repository.httpGet('posts');
  }
}