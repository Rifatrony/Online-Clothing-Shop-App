import 'package:cloth_shop_app/data/model/category_model.dart';
import 'package:get/get.dart';

import '../../data/repository/category_repo.dart';

class CategoryController extends GetxController{
  RxBool loading = false.obs;
  List<Category>? category = <Category>[];
  final repository = CategoryRepo();

  Future<void> getCategory() async {
    try{
      loading(true);
      repository.getCategory().then((value) {
        category!.addAll(value.category as Iterable<Category>);
      });
    }catch(e){

    }
  }
}