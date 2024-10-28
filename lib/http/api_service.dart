
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'client/dio_client.dart';
import 'models/account_generate_resp_entity.dart';
import 'models/base_result.dart';
import 'models/joke_detail_entity.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://testgameapi.ysgtg.com")
abstract class ApiService {
  factory ApiService({Dio? dio, String? baseUrl}) {
    return _ApiService(DioClient().dio, baseUrl: baseUrl);
  }

  ///获取主页的推荐列表数据
  @POST('/app/v1/user/account_generate')
  @FormUrlEncoded()
  Future<BaseResult<AccountGenerateRespEntity>> getAccountGenerate(
      @Field() String sign);

}