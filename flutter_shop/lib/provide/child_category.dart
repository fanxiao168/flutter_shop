import 'package:flutter/material.dart';
import '../model/category.dart';


class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;  //子类高亮索引
  String categoryId = '4'; //大类ID

//大类切换逻辑
  getChildCategory(List<BxMallSubDto> list, String id){
    childIndex = 0;
    categoryId = id;
    
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    childCategoryList = [all];
    childCategoryList.addAll(list);

    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(index){
    childIndex = index;
    notifyListeners();
  }
}