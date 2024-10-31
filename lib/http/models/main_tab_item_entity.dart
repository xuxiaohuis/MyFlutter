import 'package:myflutter/generated/json/base/json_field.dart';
import 'package:myflutter/generated/json/main_tab_item_entity.g.dart';
import 'dart:convert';
export 'package:myflutter/generated/json/main_tab_item_entity.g.dart';

@JsonSerializable()
class MainTabItemEntity {
	late String url;
	late String name;
	late String desc;

	MainTabItemEntity();

	factory MainTabItemEntity.fromJson(Map<String, dynamic> json) => $MainTabItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $MainTabItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}