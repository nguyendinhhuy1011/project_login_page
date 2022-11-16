class RatingModel {
  String avaUser;
  String nameUser;
  String datePost;
  double ratingStar;
  String titlePost;
  String contentPost;
  List? imagePost;

  RatingModel({
    required this.avaUser,
    required this.nameUser,
    required this.datePost,
    required this.ratingStar,
    required this.titlePost,
    required this.contentPost,
    this.imagePost,
  });
}
