import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/resource/component/internet_exceptions_widgets.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';
import 'package:getx_mvvm/view_model/controller/blog_controller/blog_controller.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final blogController = Get.put(BlogController());
  UserPreferences userPreferences = UserPreferences();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: _logOutButton,icon: const Icon(Icons.logout),),
          ],
        ),

        body: Column(
          children: [
            Obx(() {
              // Check the request status and return appropriate UI
              switch (blogController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator()); // Show loading indicator
                case Status.COMPLETED:
                  return Expanded(
                    child: ListView.builder(
                      itemCount: blogController.blogList.value.length ?? 0,
                      itemBuilder: (context, index) {
                        var blog = blogController.blogList.value[index];
                        return ListTile(
                          title: Text(blog.title ?? "No Title"),
                          subtitle: Text(blog.details ?? "No Description"),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(blog.blogImg.toString()),
                          ),
                    
                        );
                      },
                    ),
                  ); // Show blog list when data is fetched successfully
                case Status.ERROR:
                  if(blogController.error == "No Internet"){
                    return InternetExceptionWidgets(onPress: (){
                      blogController.blogListApi();
                    });
                  }else{
                    return  Center(child: Text(blogController.error.toString()));

                  }
                  // Show error message
                default:
                  return const SizedBox(); // Return empty widget for unhandled cases
              }
            }),
          ],
        ),
      ),
    );
  }

  void _logOutButton() {
    userPreferences.logOutUser();
    Get.offNamedUntil(RouteName.signInScreen, (route) => false);
  }
}
