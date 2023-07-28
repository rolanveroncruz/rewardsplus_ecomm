class ItemModel {
final int id;
final String name;
final String description;
final String longDescription;
final double price;
final String media;

  ItemModel({required this.id, required this.name, required this.description, required this.longDescription,required this.price, required this.media});

  factory ItemModel.fromJson(Map<String, dynamic> json ) {
    return ItemModel(
      id: json['id'], 
      name: json['name'], 
      description: json['description'], 
      longDescription: json['long_description']?? '',
      price: json['price'] ?? 0.0,
      media: json['media']?? '');
  }

}