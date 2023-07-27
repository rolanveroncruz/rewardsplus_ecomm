class ItemModel {
final int id;
final String name;
final String description;
final String long_description;
final String media;

  ItemModel({required this.id, required this.name, required this.description, required this.long_description, required this.media});

  factory ItemModel.fromJson(Map<String, dynamic> json ) {
    return ItemModel(
      id: json['id'], 
      name: json['name'], 
      description: json['description'], 
      long_description: json['long_description']?? '', 
      media: json['media']?? '');
  }

}