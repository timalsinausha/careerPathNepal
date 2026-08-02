import 'package:careernepal/careers/models/recommendation_model.dart';
import 'package:careernepal/core/constants/api_constants.dart';
import 'package:careernepal/core/network/dio_client.dart';
import 'package:flutter/material.dart';



class RecommendationApiService {

  Future<List<RecommendationModel>>
  getRecommendations() async {

    final response =
        await DioClient.dio.get(
      ApiConstants.careerRecommendations,
    );
debugPrint(response.data.toString());
    return (response.data as List)
        .map(
          (e) => RecommendationModel.fromJson(e),
        )
        .toList();
  }
}