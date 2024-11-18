import 'package:get/get.dart';
import 'package:testproject/Controllers/Apis/models/LeagueModel.dart';
import 'package:testproject/Controllers/Apis/sportsdbapi.dart';


class SportsController extends GetxController {
  var ld = true.obs;
  var list = <League>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      ld(true);
      var posts = await Sportsdbapi().fetchPosts();
      list.assignAll(posts);
    } finally {
      ld(false);
    }
  }
}