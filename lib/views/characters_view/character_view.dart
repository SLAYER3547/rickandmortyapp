import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/views/characters_view/character_viewmodel.dart';
import 'package:rickandmortyapp/views/widgets/character_card_listview.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  void initState() {
    super.initState();
    context.read<CharacterViewmodel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              _searchInputWidget(context),
              Consumer<CharacterViewmodel>(
                builder: (context, viewModel, child) {
                  if (viewModel.charactersModel == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    return CharacterCardListview(
                        characters: viewModel.charactersModel!.characters,
                        onLoadMore: () => viewModel.getCharactersMore(),
                        loadMore: viewModel.loadMore,
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Karakterlerde Ara',
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onSurface),
            prefixIcon: Icon(Icons.search),
            suffixIcon:
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            border: OutlineInputBorder()),
      ),
    );
  }
}
