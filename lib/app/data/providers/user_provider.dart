import 'package:e_librairie_front/app/core/api/exception.dart';
import 'package:e_librairie_front/app/data/providers/api_provider.dart';

class UserProvider {
  Future<dynamic> register({required Map<String, dynamic> data}) async {
    try {
      var response = await ApiProvider.post(
        route: 'users/register',
        data: data,
      );

      print(response);

      return response;
    } catch (e) {

      if(e is ApiException){
        print(e.message);
      }
      
    }
  }
}
