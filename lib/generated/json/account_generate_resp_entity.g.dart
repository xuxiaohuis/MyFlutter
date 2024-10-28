import 'package:myflutter/generated/json/base/json_convert_content.dart';
import 'package:myflutter/http/models/account_generate_resp_entity.dart';

AccountGenerateRespEntity $AccountGenerateRespEntityFromJson(
    Map<String, dynamic> json) {
  final AccountGenerateRespEntity accountGenerateRespEntity = AccountGenerateRespEntity();
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    accountGenerateRespEntity.account = account;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    accountGenerateRespEntity.password = password;
  }
  return accountGenerateRespEntity;
}

Map<String, dynamic> $AccountGenerateRespEntityToJson(
    AccountGenerateRespEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['account'] = entity.account;
  data['password'] = entity.password;
  return data;
}

extension AccountGenerateRespEntityExtension on AccountGenerateRespEntity {
  AccountGenerateRespEntity copyWith({
    String? account,
    String? password,
  }) {
    return AccountGenerateRespEntity()
      ..account = account ?? this.account
      ..password = password ?? this.password;
  }
}