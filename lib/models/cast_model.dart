class CastModel {
  final String name;
  final String image;
  final String character;

  CastModel({
    required this.name,
    required this.image,
    required this.character,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'character': this.character,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    final urlBaseImages = 'https://image.tmdb.org/t/p/w200';
    return CastModel(
      name: map['original_name'] ?? '',
      image: '$urlBaseImages${map['profile_path']}',
      character: map['character'] ?? '',
    );
  }
}
