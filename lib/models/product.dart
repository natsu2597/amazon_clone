


import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(jsonDecode(str));
String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson)));   

class Product{
  final String name;
  final String description;
  final double quantity;
  final double price;
  final List<String> images;
  final String category;
  final String? id;
  

  Product({required this.name,
   required this.description,
   required this.quantity,
   required this.price,
   required this.images,
   required this.category,
            this.id,
            
  });

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id' : id,
      
    };
  }

  factory Product.fromMap(Map<String,dynamic> map){
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? '',
      id: map['_id'] ?? '',
      

    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
    Product.fromMap(json.decode(source));
}