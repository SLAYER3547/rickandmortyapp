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

  bool loadMore = false;
  void getCharactersMore() async {
    if (loadMore) return;
    loadMore = true;
    final data =
        await _apiService.getAllCharacters(url: charactersModel?.info.next);
    loadMore = false;
    _characterModel!.info = data.info;
    _characterModel!.characters.addAll(data.characters);
    notifyListeners();
  }
}
