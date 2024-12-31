import 'package:flutter/material.dart';
import 'package:rickandmortyapp/app/locator.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/api_service.dart';

class CharacterViewmodel extends ChangeNotifier {
  final _apiService = locator<ApiService>();
  CharactersModel? _characterModel;
  CharactersModel? get charactersModel => _characterModel;

  void getCharacters() async {
    _characterModel = await _apiService.getAllCharacters();
    notifyListeners();
  }
}
