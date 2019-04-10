/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-09 11:49:22
 * @LastEditTime: 2019-04-10 15:29:50
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study/RoutesConfig.dart';

class Routes extends StatelessWidget {
  List<ListItem> _listData;
  void initData() {
    _listData = [];

    _listData.add(ListItem('customPainter', routesList[0], Icons.flag));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('列表'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return index < _listData.length
              ? ListItemWidget(_listData[index])
              : null;
        },
      ),
    );
  }
}

class ListItem {
  final String title;
  final String routeName;
  final IconData iconData;
  ListItem(this.title, this.routeName, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;
  ListItemWidget(this.listItem);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(listItem.title),
      leading: Icon(listItem.iconData),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, listItem.routeName);
      },
    );
  }
}
