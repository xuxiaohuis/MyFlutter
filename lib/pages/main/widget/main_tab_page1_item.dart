
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../http/models/main_tab_item_entity.dart';

class MainTabPage1Item extends StatelessWidget{

  final MainTabItemEntity item;

  const MainTabPage1Item({required this.item ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
      decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
            child: CachedNetworkImage(
              imageUrl: item.url,
              fit: BoxFit.cover,
            ),
          ),
          Text(item.name),
          Text(item.desc)
        ],
      )
    );
  }



}
