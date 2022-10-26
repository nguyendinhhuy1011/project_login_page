class NewFeedModel {
  String avaUser;
  String nameUser;
  String datePost ;
  String status;
  String titlePost;
  String contentPost;
  List? imagePost;

  NewFeedModel({
    required this.avaUser,
    required this.nameUser,
    required this.datePost,
    required this.status,
    required this.titlePost,
    required this.contentPost,
    this.imagePost,
});
}
