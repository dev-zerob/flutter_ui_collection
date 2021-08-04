class NikeShoes {
  final String model;
  final int price;
  final int discountedPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  NikeShoes({
    required this.model,
    required this.price,
    required this.discountedPrice,
    required this.images,
    required this.modelNumber,
    required this.color,
  });
}

final shoes = <NikeShoes>[
  NikeShoes(
    model: 'AIR MAX 90 EZ Black',
    price: 399000,
    discountedPrice: 399000,
    images: [
      'assets/nike_shoes_store/images/shoes1_1.png',
      'assets/nike_shoes_store/images/shoes1_2.png',
      'assets/nike_shoes_store/images/shoes1_3.png',
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: 'AIR MAX 270 Gold',
    price: 349000,
    discountedPrice: 199000,
    images: [
      'assets/nike_shoes_store/images/shoes2_1.png',
      'assets/nike_shoes_store/images/shoes2_2.png',
      'assets/nike_shoes_store/images/shoes2_3.png',
    ],
    modelNumber: 270,
    color: 0xFFFCF5EB,
  ),
  NikeShoes(
    model: 'AIR MAX 95 Red',
    price: 299000,
    discountedPrice: 149000,
    images: [
      'assets/nike_shoes_store/images/shoes3_1.png',
      'assets/nike_shoes_store/images/shoes3_2.png',
      'assets/nike_shoes_store/images/shoes3_3.png',
    ],
    modelNumber: 95,
    color: 0xFFFEEFEF,
  ),
  NikeShoes(
    model: 'AIR MAX 98 FREE',
    price: 299000,
    discountedPrice: 149000,
    images: [
      'assets/nike_shoes_store/images/shoes4_1.png',
      'assets/nike_shoes_store/images/shoes4_2.png',
      'assets/nike_shoes_store/images/shoes4_3.png',
    ],
    modelNumber: 98,
    color: 0xFFEDF3FE,
  ),
];
