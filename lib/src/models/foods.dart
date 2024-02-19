class Foods {
  final String name;
  final String img;
  final double price;
  const Foods({required this.name, required this.img, required this.price});
}

final List<Foods> foodData = [
  Foods(name: 'Alaska', img: 'assets/images/books/alaska.jpg', price: 11.00),
  Foods(
      name: 'Apa adanya', img: 'assets/images/books/apaadanya.jpg', price: 5.0),
  Foods(name: 'aRYA', img: 'assets/images/books/ARYA.jpg', price: 6.0)
];
