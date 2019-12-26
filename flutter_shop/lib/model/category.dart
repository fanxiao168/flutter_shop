



class CategoryBigModel{
  String mallCategoryId;   //类别编号
  String mallCategoryName;  //类别名称
  List<dynamic> bxMallSubDto;  //小类列表
  Null  comments;           //列表描述
  String image;             //类别图片

  //构造函数
  CategoryBigModel({
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image
  });

  //工厂模式-用这种模式可以省略New 关键字
  factory CategoryBigModel.fromJson(dynamic json){
  
    return CategoryBigModel(
        mallCategoryId:json['mallCategoryId'],
        mallCategoryName:json['mallCategoryName'],
        bxMallSubDto:json['bxMallSubDto'],
        comments:json['comments'],
        image:json['image'],
    );
  }
}


class CategoryBigListModel {
  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);
  factory CategoryBigListModel.formJson(List json){
    return CategoryBigListModel(
      json.map((i)=>CategoryBigModel.fromJson((i))).toList()
    );
  }
}


