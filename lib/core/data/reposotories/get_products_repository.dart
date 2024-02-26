import 'dart:developer';

import 'package:challenge_2/core/data/models/products_model.dart';
import 'package:challenge_2/core/data/models/common_response.dart';
import 'package:challenge_2/core/data/network/endpoints/products_endpoints.dart';
import 'package:challenge_2/core/data/network/network_config.dart';
import 'package:challenge_2/core/enums/request_type.dart';
import 'package:challenge_2/core/utils/network_util.dart';
import 'package:dartz/dartz.dart';

class getProductsRepository {
  Future<Either<String, List<ProductsModel>>> getproductsbycategory(
      {required String category}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getproductsbycategory + category,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<ProductsModel> resultList = [];
          commonResponse.data!.forEach(
            (element) {
              resultList.add(ProductsModel.fromJson(element));
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

  Future<Either<String, List<ProductsModel>>> getAll(
      {required String category}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductsEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<ProductsModel> resultList = [];
          commonResponse.data!.forEach(
            (element) {
              resultList.add(ProductsModel.fromJson(element));
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

  Future<Either<String, bool>> editProduct({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.PUT,
          url: ProductsEndpoints.editProduct,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.PUT,
          ),
          body: {
            "title": title,
            "price": price,
            "description": description,
            "category": category,
            "image": description,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(true);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, ProductsModel>> deleteProduct({
    required int id,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        url: ProductsEndpoints.deleteProduct + id.toString(),
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.DELETE,
        ),
        body: {},
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(ProductsModel.fromJson(commonResponse.data));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
