enum BookType { All, Nonfiksi, Romance, Fantasi, Horor }

class Book {
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String desc;
  double score;
  BookType type;
  int voter;
  Book(this.image, this.name, this.desc, this.isFavorite, this.price,
      this.quantity, this.score, this.type, this.voter);
}
