import 'package:myflutter/generated/json/base/json_convert_content.dart';
import 'package:myflutter/http/models/main_tab_item_entity.dart';

MainTabItemEntity $MainTabItemEntityFromJson(Map<String, dynamic> json) {
  final MainTabItemEntity mainTabItemEntity = MainTabItemEntity();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    mainTabItemEntity.url = url;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    mainTabItemEntity.name = name;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    mainTabItemEntity.desc = desc;
  }
  return mainTabItemEntity;
}

Map<String, dynamic> $MainTabItemEntityToJson(MainTabItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['name'] = entity.name;
  data['desc'] = entity.desc;
  return data;
}

extension MainTabItemEntityExtension on MainTabItemEntity {
  MainTabItemEntity copyWith({
    String? url,
    String? name,
    String? desc,
  }) {
    return MainTabItemEntity()
      ..url = url ?? this.url
      ..name = name ?? this.name
      ..desc = desc ?? this.desc;
  }
}