import 'package:get/get.dart';

class FilterController extends GetxController {
  var isFilterVisible = false.obs;
  var selectedCategory = "All".obs;
  var selectedSort = "Trending".obs;

  void toggleFilter() => isFilterVisible.value = !isFilterVisible.value;
  void setCategory(String category) => selectedCategory.value = category;
  void setSort(String sort) => selectedSort.value = sort;
}
