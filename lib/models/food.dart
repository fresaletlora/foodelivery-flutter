part of 'models.dart';

enum FoodType { new_food, popular, recommended}

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recommended;
            break;
          case 'popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          "https://blog.tiket.com/wp-content/uploads/Nasi-Goreng-Kambing-Kebon-Sirih.jpg",
      name: "Nasi Goreng Vignolia",
      description:
          "Ini Nasi Goreng mantap lah pokoknya seriusan, isinya banyak kali lah gapaham lagi aku ngeliat ini nasi goreng bikin ngiler aja, udah lah langsung klik order aja dibawah cepetan",
      ingredients: "Nasi, Bawang Merah, Bawang Putih, dan Kasih Sayang",
      price: 15000,
      rate: 4.2,
      types: [FoodType.new_food, FoodType.recommended, FoodType.popular] ),
  Food(
      id: 2,
      picturePath:
          "https://agathadelicioustaste.files.wordpress.com/2012/10/sate_padang.jpg",
      name: "Sate Padang",
      description: "Ini Nasigoreng mantap lah pokoknya seriusan",
      ingredients: "Nasi, Bawang Merah, Bawang Putih, dan Kasih Sayang",
      price: 20000,
      rate: 3.9),
  Food(
      id: 3,
      picturePath:
          "https://www.masakapahariini.com/wp-content/uploads/2018/10/burger-rendang-MAHI-6.jpg",
      name: "Burger Bener",
      description: "Ini Nasigoreng mantap lah pokoknya seriusan",
      ingredients: "Nasi, Bawang Merah, Bawang Putih, dan Kasih Sayang",
      price: 13000,
      rate: 4.8,
      types: [FoodType.new_food] ),
  Food(
      id: 4,
      picturePath:
          "https://assets-pergikuliner.com/4J-uNVePqHATs48Ppvnu5zkGwDs=/312x0/smart/https://assets-pergikuliner.com/uploads/image/picture/1281646/picture-1550644721.JPG",
      name: "Steak Nurset",
      description: "Ini Nasigoreng mantap lah pokoknya seriusan",
      ingredients: "Nasi, Bawang Merah, Bawang Putih, dan Kasih Sayang",
      price: 400000,
      rate: 5.0,
      types: [FoodType.recommended] ),
  Food(
      id: 5,
      picturePath:
          "https://www.masakapahariini.com/wp-content/uploads/2019/11/shutterstock_1469046305-780x440.jpg",
      name: "Soto Betawi Mamang Kesbor",
      description: "Ini Nasigoreng mantap lah pokoknya seriusan",
      ingredients: "Nasi, Bawang Merah, Bawang Putih, dan Kasih Sayang",
      price: 19000,
      rate: 3.2),
];
