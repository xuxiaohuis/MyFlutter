import 'package:myflutter/generated/json/base/json_field.dart';
import 'package:myflutter/generated/json/account_generate_resp_entity.g.dart';
import 'dart:convert';
export 'package:myflutter/generated/json/account_generate_resp_entity.g.dart';

@JsonSerializable()
class AccountGenerateRespEntity {
	late String account;
	late String password;

	AccountGenerateRespEntity();

	factory AccountGenerateRespEntity.fromJson(Map<String, dynamic> json) => $AccountGenerateRespEntityFromJson(json);

	Map<String, dynamic> toJson() => $AccountGenerateRespEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}