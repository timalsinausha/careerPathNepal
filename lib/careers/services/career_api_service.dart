import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../models/career_details_model.dart';
import '../models/careerlist.dart';

class CareerApiService {
  Future<CareerDetailModel> getCareerDetail(
      String slug) async {
    final response = await DioClient.dio.get(
      "${ApiConstants.careers}$slug/",

 
    );
  
  
    return CareerDetailModel.fromJson(
      response.data,
    );
  }

    Future<List<CareerListModel>> getCareers() async {

    final response = await DioClient.dio.get(
      ApiConstants.careers,
    );

    final List data = response.data;

    return data
        .map(
          (json) => CareerListModel.fromJson(json),
        )
        .toList();
  }

}
