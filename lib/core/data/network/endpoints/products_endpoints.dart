import 'package:challenge_2/core/data/network/network_config.dart';

class ProductsEndpoints {
  static String getproductsbycategory =
      NetworkConfig.getFullApiRoute('category/');
  static String getAll = NetworkConfig.getFullApiRoute('');
  static String editProduct = NetworkConfig.getFullApiRoute('7');
  static String deleteProduct = NetworkConfig.getFullApiRoute('');

  //""
//   static String getAlljewelery =
//       NetworkConfig.getFullApiRoute('category/jewelery');
//   static String getAllmenclothing =
//       NetworkConfig.getFullApiRoute('category/men\'s clothing');
//   static String getAllwomenclothing =
//       NetworkConfig.getFullApiRoute('category/women\'s clothing');
// }
}
