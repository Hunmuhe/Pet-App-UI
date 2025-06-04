import 'package:flutter/material.dart';
import 'package:pet_app_ui/l10n/app_localizations.dart';

class Board {
  final String text, image;

  Board({required this.text, required this.image});
}

List<Board> boardsData(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;
  
  return [
    Board(text: localizations.board1, image: "assets/images/image1.png"),
    Board(text: localizations.board2, image: "assets/images/image2.png"),
    Board(text: localizations.board3, image: "assets/images/image3.png"),
  ];
}
