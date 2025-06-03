class Board {
  final String text, image;

  Board({required this.text, required this.image});
}

List<Board> boardsData = [
  Board(
    text: 'Join us and discover the best\npet in your location',
    image: "assets/pets-image/image1.png",
  ),
  Board(
    text: "We help people connect with pet \naround your Location",
    image: "assets/pets-image/image2.png",
  ),
  Board(
    text: "We show the easy way to adopt pet. \nJust stay at home with us.",
    image: "assets/pets-image/image3.png",
  ),
];
