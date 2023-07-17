import 'package:dio/dio.dart';
import 'package:great_advice/repositories/models/advice_model.dart';

class GreatAdviceRepository {
  Future<AdviceModel> getRandomAdvice() async {
    Uri _uri = Uri(
        host: 'fucking-great-advice.ru', path: '/api/random', scheme: 'https');

    final responce = await Dio().getUri(_uri);

    return AdviceModel.fromJson(responce.data);
  }
}
