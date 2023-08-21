import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class FavoriteData {
  Curd curd;
  FavoriteData(this.curd);

  addFavorite(String usersid, String itemsid) async {
    var response = await curd.postData(
        AppLink.favoriteAdd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await curd.postData(
        AppLink.favoriteRemove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
