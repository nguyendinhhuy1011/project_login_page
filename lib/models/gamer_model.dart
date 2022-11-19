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

  // static List<GamerModel> gamers =[
  //   GamerModel(
  //     name: 'Quyen',
  //     age: '20',
  //     rating: 4.7,
  //     rank: 'Tinh Anh',
  //     game: 'League of Legend',
  //     bio: 'Nếu không chơi tinder thì cứ TinEm',
  //     imageUrl: 'https://luv.vn/wp-content/uploads/2022/06/gai-xinh-cap-3-luv-15-edited.jpg?v=1655091824',
  //   ),
  //   GamerModel(
  //     name: 'Phuong Anh',
  //     age: '22',
  //     rating: 4.8,
  //     rank: 'Cao Thủ',
  //     game: 'Mobile Legend',
  //     bio: 'Cô đơn thì call me',
  //     imageUrl: 'https://kenh14cdn.com/thumb_w/620/2019/2/24/3561716420480213454575853861059020806684672n-15510057259571546306615.jpg',
  //   ),
  //   GamerModel(
  //     name: 'Uyen Nhi',
  //     age: '21',
  //     rating: 4.9,
  //     rank: 'Thách Đấu',
  //     game: 'Arena of Value',
  //     bio: 'Anh cứ việc feed, gánh team để em lo',
  //     imageUrl: 'https://timanhdep.com/wp-content/uploads/2022/06/hinh-anh-gai-xinh-tiktok-dep-33.jpg',
  //   ),
  //   GamerModel(
  //     name: 'Hang',
  //     age: '26',
  //     rating: 4.5,
  //     rank: 'Tinh Anh',
  //     game: 'Dota',
  //     bio: 'Chơi không học vừa khỏe vừa vui',
  //     imageUrl: 'https://i.pinimg.com/736x/04/0a/6f/040a6f395f3ab6ae5ff2437a44d24b28.jpg',
  //   ),
  //   GamerModel(
  //     name: 'Kim',
  //     age: '18',
  //     rating: 4.6,
  //     rank: 'Tinh Anh',
  //     game: 'Arena Of Value',
  //     bio: 'Anh ơi, gió lạnh đang về. Bao nhiêu lớp áo đâu bằng love anh',
  //     imageUrl: '',
  //   ),
  //   GamerModel(
  //     name: 'Nhung',
  //     age: '18',
  //     rating: 4.5,
  //     rank: 'Kim Cương',
  //     game: 'League of Legend',
  //     bio: 'Bất cần đời, but cần anh',
  //     imageUrl: 'https://i.pinimg.com/564x/07/2a/49/072a49bff1cd5ba68f7e4001c4558a72.jpg',
  //   ),
  //   GamerModel(
  //     name: 'Sam Sam',
  //     age: '24',
  //     rating: 4.7,
  //     rank: 'Cao Thủ',
  //     game: 'Arena of Value',
  //     bio: 'Kẻ huỷ diệt liên quân là em',
  //     imageUrl: 'https://i.pinimg.com/564x/14/51/a6/1451a6ff4e9e9e9aea24109cb6652cb7.jpg',
  //   ),
  //   GamerModel(
  //     name: 'Ginnie',
  //     age: '19',
  //     rating: 4.5,
  //     rank: 'Tinh Anh',
  //     game: 'PUBG Mobile',
  //     bio: 'Book rồi kéo em lên cao thủ với nhé',
  //     imageUrl: 'https://i.pinimg.com/750x/ec/cb/30/eccb30a14b2438ff53453771679d47e5.jpg',
  //   ),
  //
  // ];

}
