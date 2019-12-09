import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(child: Text('商城首页')),
    );
  }
}

void getHttp() async {
  try{
    Response response;
    response = await Dio().get("https://api.apiopen.top/searchMusic?name=雅俗共赏");
    return print(response);
  }catch(e){
    return print(e);
  }
}