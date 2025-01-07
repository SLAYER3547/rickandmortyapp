import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/views/widgets/character_card_view.dart';

class CharacterCardListview extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadMore;
  final bool loadMore;
  const CharacterCardListview(
      {super.key,
      required this.characters,
      required this.onLoadMore,
      this.loadMore = false});

  @override
  State<CharacterCardListview> createState() => _CharacterCardListviewState();
}

class _CharacterCardListviewState extends State<CharacterCardListview> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    detectScrollBottom();
    super.initState();
  }

  void detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 200;

      if (maxScroll - currentPosition <= delta) {
        widget.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.characters.length,
          itemBuilder: (context, index) {
            final characterModel = widget.characters[index];
            return Column(
              children: [
                CharacterCardView(characterModel: characterModel),
                if(widget.loadMore && index == widget.characters.length - 1)
                  const CircularProgressIndicator.adaptive()
              ],
            );
          }),
    );
  }
}
