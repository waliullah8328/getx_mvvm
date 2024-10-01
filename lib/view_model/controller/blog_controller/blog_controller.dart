import 'package:get/get.dart';

import 'package:getx_mvvm/repository/blog_repository/blog_repository.dart';
import '../../../data/response/status.dart';

class BlogController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    blogListApi();
  }



  final _api = BlogRepository();
  RxString error = "".obs;
  final rxRequestStatus = Status.LOADING.obs;
  final blogList = <BlogModel>[].obs;  // Observable list of BlogModel

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setBlogList(List<BlogModel> _value) => blogList.value = _value;
  void setError(String _value) => error.value = _value;

  void blogListApi() {
    _api.blogListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setBlogList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print('Error: $error');
    });
  }
}
