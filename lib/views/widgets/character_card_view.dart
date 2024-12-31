import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';

class CharacterCardView extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterCardView({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(height: 100, characterModel.image)),
                SizedBox(
                  width: 17,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        characterModel.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      _infoWidget(type: 'Köken', value: characterModel.origin.name),
                      const SizedBox(
                        height: 4.0,
                      ),
                      _infoWidget(type: 'Durum', value: '${characterModel.status} ${characterModel.species}')
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border))
        ],
      ),
    );
  }

  Column _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        ),
        Text(value),
      ],
    );
  }
}
