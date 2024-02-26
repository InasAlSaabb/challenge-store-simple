//ملف الاعدادادتى لكامل ال api
import 'package:challenge_2/core/enums/request_type.dart';
import 'package:challenge_2/ui/shared/utils.dart';

class NetworkConfig {
  static String BASE_API = '/products/';
  static String BASE_API2 = '/auth/';
  static String getFullApiRoute(String apiroute) {
    return BASE_API + apiroute;
  }

  static String getFullApiRoute2(String apiroute) {
    return BASE_API2 + apiroute;
  }

  static Map<String, String>? getHeaders(
      {bool needAuth = true,
      RequestType? type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth)
        "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      if (type != RequestType.GET)
        "Content-Type": type == RequestType.MULTIPART
            ? "multipart/form-data"
            : "application/json",
      ...extraHeaders ?? {}
    };
  }
}
