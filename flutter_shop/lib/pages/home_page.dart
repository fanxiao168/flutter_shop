import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎您来到美好人间高级会所';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('美好人间')),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '歌名',
                      helperText: '请输入歌名',
                    ),
                    autofocus: false,
                  ),
                  RaisedButton(
                    onPressed: _choiceAction,
                    child: Text('选择完毕'),
                  ),
                  Text(
                    showText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _choiceAction() {
    print('开始选择歌名.......');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('内容不能为空')));
    } else {
      postHttp(typeController.text.toString()).then((val) {
        setState(() {
          print(val);
          showText = val['result'].toString();
        });
      });
    }
  }

  Future postHttp(String TypeText) async {
    try {
      Response response;
      var data = {'name': TypeText};
      response = await Dio()
          .post("https://api.apiopen.top/searchMusic", queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
