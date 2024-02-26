import 'package:challenge_2/core/data/models/common_response.dart';
import 'package:challenge_2/core/data/network/endpoints/user_endpoints.dart';
import 'package:challenge_2/core/data/network/network_config.dart';
import 'package:challenge_2/core/enums/request_type.dart';
import 'package:challenge_2/core/utils/network_util.dart';
import 'package:dartz/dartz.dart';

import '../models/apis/token_info.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> Login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndpoints().Login,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'username': email,
            'password': password,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }
}
