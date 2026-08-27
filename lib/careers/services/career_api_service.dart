import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../models/career_details_model.dart';

class CareerApiService {
  Future<CareerDetailModel> getCareerDetail(
      String slug) async {
  final url =
      "${ApiConstants.courseDetail}$slug/";
         print("COURSE SLUG: $slug");
   print("COURSE URL: $url");

    final response = await DioClient.dio.get(
      "${ApiConstants.careers}$slug/",

 
    );
  
  
print(response.data);
    return CareerDetailModel.fromJson(
      response.data,
    );
  }
}