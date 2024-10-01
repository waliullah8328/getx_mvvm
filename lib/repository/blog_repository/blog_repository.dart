import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/blog_model/blog_model.dart';
import 'package:getx_mvvm/resource/app_url/app_url.dart';

class BlogRepository {

  final _apiServices = NetworkApiServices();

  // Modify to return a List of BlogModel
  Future<List<BlogModel>> blogListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.blogApi);

    // Check if the response is a list
    if (response is List) {
      return BlogModel.fromJsonList(response); // Parse the list of blogs
    } else {
      throw Exception('Unexpected response format');
    }
  }
}
