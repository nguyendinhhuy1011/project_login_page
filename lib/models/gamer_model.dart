class GamerModel {
  final String name;
  final String age;
  final String imageUrl;
  final double rating;
  final String rank;
  final String bio;
  final String game;

  GamerModel(
      {required this.name,
      required this.age,
      required this.imageUrl,
      required this.rating,
      required this.rank,
      required this.bio,
      required this.game});

  @override
  List<Object?> get props => [name, age, imageUrl, rating, rank, bio, game];



}
