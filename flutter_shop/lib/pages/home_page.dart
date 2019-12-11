import 'package:flutter/material.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  String homePageContent = '正在请求数据...';

  @override
  void initState() {
    getHomePageContent().then((val){
      setState(() {
        homePageContent = val.toString();
      });
      super.initState();
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('百姓生活+')),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(homePageContent)
                ],
              ),
            ),
          )),
    );
  }

}
