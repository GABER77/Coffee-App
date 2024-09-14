class Product {
  String image;
  String name;
  String price;
  String rate;
  String type;
  int quantity;
  String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.rate,
    required this.type,
    required this.quantity,
    required this.description,
  });
}

class ProductModel {
  List<Product> myProduct = [
    Product(
        image: "assets/images/product1.jpg",
        name: "Cinnamon &\nCocoa",
        price: "14.95",
        rate: "4.5",
        type: 'null',
        quantity: 1,
        description: "If you have ever tasted cinnamon straight out of the jar, it has a bitter taste. However, when you mix it in your food and drink, the flavour profile changes completely."),
    Product(
        image: "assets/images/product2.jpg",
        name: "Drizzled with\nCaramel",
        price: "12.95",
        rate: "4.7",
        type: 'null',
        quantity: 1,
        description: "Homemade iced caramel coffee is equal parts delicious, refreshing and easy! It’s a cold glass of cold coffee and milk, drizzled with caramel and topped with the option of whipped cream"),
    Product(
        image: "assets/images/product3.jpg",
        name: "Bursting\nBlueberry",
        price: "26.95",
        rate: "4.9",
        type: 'null',
        quantity: 1,
        description: "Blueberry is a delicious and refreshing drink that is made with fresh blueberries, milk and sugar. It’s a great way to start your day or to add a little extra sweetness to your afternoon Coffee."),
    Product(
        image: "assets/images/product4.jpg",
        name: "Dalgona\nWhipped",
        price: "21.95",
        rate: "4.1",
        type: 'null',
        quantity: 1,
        description: "Dalgona is a delicious and refreshing drink, milk and sugar. It’s a great way to start your day or to add a little extra sweetness to your afternoon Coffee."),
    Product(
      image: "assets/images/product5.jpg",
      name: "hazelnut\nCoffee",
      price: "18.95",
      rate: "4.3",
      type: 'null',
      quantity: 1,
      description: "Hazelnut coffee is a delicious and refreshing drink that is made with hazelnut milk and sugar. It’s a great way to start your day or to add a little extra sweetness to your afternoon Coffee.",
    ),
    Product(
        image: "assets/images/product6.jpg",
        name: "Milky\nCoffee",
        price: "7.95",
        rate: "4.4",
        type: 'null',
        quantity: 1,
        description: "Milky Coffee is a delicious and refreshing drink. It’s a great way to start your day or to add a little extra sweetness to your afternoon Coffee."),
  ];
}