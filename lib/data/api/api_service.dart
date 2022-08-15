import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:facebook_clone/data/models/login_res_model.dart';

class APIService {
  var dio = Dio();

  Future<Either<String, LoginResModel>> login(
      {required String email, required String pass}) async {
    String urlString = "http://127.0.0.1:8000/api/login";
    var data = {'email': email, 'password': pass};
    try {
      Response res = await dio.post(
        urlString,
        data: data,
        options: Options(
          // headers: {
          //   'Authorization': box.read(CacheManagerKey.TOKEN.toString()),
          // },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 505;
          },
        ),
      );
      if (res.statusCode == 200) {
        return Right(LoginResModel.fromJson(res.data));
      } else {
        print('state code ${res.statusCode}');
        return Left(
          res.data['description'].toString(),
        );
      }
    } catch (e) {
      print('get user role error ${e}');
      return Left(
        e.toString(),
      );
    }
  }
}
