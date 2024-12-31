import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rickandmortyapp/models/character_model.dart';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
  Future<CharactersModel> getAllCharacters({String? url}) async {
    try {
      final response = await _dio.get(url ?? '/character');
      return CharactersModel.fromJson(response.data);
    } on DioException catch (e) {
      log('İstek hatası $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
