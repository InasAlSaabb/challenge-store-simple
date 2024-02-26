import 'package:challenge_2/core/data/models/common_response.dart';
import 'package:challenge_2/core/data/network/endpoints/category_endpoints.dart';
import 'package:challenge_2/core/data/network/network_config.dart';
import 'package:challenge_2/core/enums/request_type.dart';
import 'package:challenge_2/core/utils/network_util.dart';
import 'package:dartz/dartz.dart';

class getCategoryRepository {
  Future<Either<String, List<String>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: categoryEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<String> resultList = [];
          commonResponse.data!.insert(0, "All");
          // resultlist.add("All")
          commonResponse.data!.forEach(
            (element) {
              resultList.add(element);
            },
          );
          return Right(resultList);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
