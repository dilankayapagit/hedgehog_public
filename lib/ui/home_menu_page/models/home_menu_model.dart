import 'package:get/get.dart';
import 'autolayouthor_item_model.dart';
import 'home_menu_item_model.dart';

class HomeMenuModel {
  RxList<AutolayouthorItemModel> autolayouthorItemList =
      RxList.filled(4, AutolayouthorItemModel());

  RxList<HomeMenuItemModel> homeMenuItemList =
      RxList.filled(3, HomeMenuItemModel());
}
