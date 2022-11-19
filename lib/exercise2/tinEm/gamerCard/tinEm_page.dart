import 'package:flutter/material.dart';

import 'package:homework2/common/const/choiceButton.dart';

import 'package:homework2/exercise2/tinEm/bottom_navigation_page.dart';
import 'package:homework2/models/gamer_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:swipe_cards/swipe_cards.dart';

import 'gamerCard.dart';

List<GamerModel> listGamers = [
  GamerModel(
    name: 'Quyen',
    age: '20',
    rating: 4.7,
    rank: 'Tinh Anh',
    game: 'League of Legend',
    bio: '260',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2022/06/gai-xinh-cap-3-luv-15-edited.jpg?v=1655091824',
  ),
  GamerModel(
    name: 'Phuong Anh',
    age: '22',
    rating: 4.8,
    rank: 'Cao Thủ',
    game: 'Mobile Legend',
    bio: '240',
    imageUrl:
    'https://kenh14cdn.com/thumb_w/620/2019/2/24/3561716420480213454575853861059020806684672n-15510057259571546306615.jpg',
  ),
  GamerModel(
    name: 'Uyen Nhi',
    age: '21',
    rating: 4.9,
    rank: 'Thách Đấu',
    game: 'Arena of Valor',
    bio: '330',
    imageUrl:
    'https://timanhdep.com/wp-content/uploads/2022/06/hinh-anh-gai-xinh-tiktok-dep-33.jpg',
  ),
  GamerModel(
    name: 'Ha Ng',
    age: '26',
    rating: 4.5,
    rank: 'Tinh Anh',
    game: 'Dota',
    bio: '190',
    imageUrl:
    'https://i.pinimg.com/736x/04/0a/6f/040a6f395f3ab6ae5ff2437a44d24b28.jpg',
  ),
  GamerModel(
    name: 'Mie Ngn',
    age: '18',
    rating: 4.6,
    rank: 'Tinh Anh',
    game: 'Arena Of Valor',
    bio: '290',
    imageUrl: 'http://linkvaobong88ag.vip/wp-content/uploads/2020/11/mie-nguyen-2.jpg',
  ),
  GamerModel(
    name: 'Nhung',
    age: '18',
    rating: 4.5,
    rank: 'Kim Cương',
    game: 'League of Legend',
    bio: '180',
    imageUrl:
    'https://i.pinimg.com/564x/07/2a/49/072a49bff1cd5ba68f7e4001c4558a72.jpg',
  ),
  GamerModel(
    name: 'Sam Sam',
    age: '24',
    rating: 4.7,
    rank: 'Cao Thủ',
    game: 'Arena of Valor',
    bio: '230',
    imageUrl:
    'https://i.pinimg.com/564x/14/51/a6/1451a6ff4e9e9e9aea24109cb6652cb7.jpg',
  ),
  GamerModel(
    name: 'Ginnie',
    age: '19',
    rating: 4.5,
    rank: 'Tinh Anh',
    game: 'Dota',
    bio: '200',
    imageUrl:
    'https://i.pinimg.com/564x/46/95/c8/4695c8ae53055d922e643fa0692fc466.jpg',
  ),
  GamerModel(
    name: 'Ngoc ',
    age: '22',
    rating: 4.8,
    rank: 'Bạch Kim',
    game: 'PUBG Mobile',
    bio: '280',
    imageUrl:
    'https://hinhgaixinh.com/wp-content/uploads/2021/10/gai-xinh-instagram-de-thuong-13.jpg',
  ),
  GamerModel(
    name: 'Lili',
    age: '24',
    rating: 4.7,
    rank: 'Kim Cương',
    game: 'PUBG Mobile',
    bio: '210',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-11.jpg',
  ),
  GamerModel(
    name: 'Nora',
    age: '19',
    rating: 4.6,
    rank: 'Tinh Anh',
    game: 'Arena Of Valor',
    bio: '240',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-16.jpg',
  ),
  GamerModel(
    name: 'Lucy',
    age: '26',
    rating: 4.6,
    rank: 'Vàng',
    game: 'Arena Of Valor',
    bio: '200',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-26.jpg',
  ),
  GamerModel(
    name: 'Han Hang',
    age: '26',
    rating: 4.9,
    rank: 'Tinh Anh',
    game: 'Arena Of Valor',
    bio: '350',
    imageUrl:
    'https://kenh14cdn.com/thumb_w/660/2019/8/13/5701964721271424609112723570206275340525945n-15657145644941216855061.jpg',
  ),
  GamerModel(
    name: 'Mai Ngn',
    age: '21',
    rating: 4.5,
    rank: 'Bạch Kim',
    game: 'Free Fire',
    bio: '220',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-40.jpg',
  ),
  GamerModel(
    name: 'Na',
    age: '18',
    rating: 4.5,
    rank: 'Vàng',
    game: 'CSGO',
    bio: '200',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-67.jpg',
  ),
  GamerModel(
    name: 'Mai Anh',
    age: '22',
    rating: 4.7,
    rank: 'Bạc',
    game: 'Free Fire',
    bio: '200',
    imageUrl:
    'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-73.jpg',
  ),
  GamerModel(
    name: 'Truong Nhi',
    age: '20',
    rating: 4.6,
    rank: 'Vàng',
    game: 'Dota',
    bio: '240',
    imageUrl:
    'https://i.pinimg.com/564x/61/a0/05/61a005aa11d86c19813937528d88c21c.jpg',
  ),
  GamerModel(
    name: 'MyDuyen',
    age: '19',
    rating: 4.6,
    rank: 'Vàng',
    game: 'CSCO',
    bio: '210',
    imageUrl:
    'https://i.pinimg.com/564x/b5/2b/0d/b52b0d2c98a2fb1be8634c2eef0d2621.jpg',
  ),
  GamerModel(
    name: 'Marin',
    age: '20',
    rating: 4.7,
    rank: 'Bạc',
    game: 'Free Fire',
    bio: '240',
    imageUrl:
    'https://i.pinimg.com/564x/13/9b/39/139b39fad02173b9888797c76d3b8365.jpg',
  ),
  GamerModel(
    name: 'Chung Anh',
    age: '22',
    rating: 4.8,
    rank: 'Tinh Anh',
    game: 'League of Legend',
    bio: '260',
    imageUrl:
    'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-6/287112054_378881497551518_3178753256483131026_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=4edsOfdIlqwAX_09EhZ&tn=ZDCZgRMWGYH6ceSP&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfDEMcfwTvUNuAf17YDOqQXqnaFJG_UGqNZjiHbn991EhA&oe=637EAC52',
  ),
  GamerModel(
    name: 'Uyin Phan',
    age: '24',
    rating: 4.7,
    rank: 'Cao Thủ',
    game: 'League of Legend',
    bio: '250',
    imageUrl:
    'https://i.pinimg.com/564x/0a/4f/0c/0a4f0c588fc69c95832780993c3d5599.jpg',
  ),
  GamerModel(
    name: 'illie',
    age: '25',
    rating: 4.6,
    rank: 'Tinh Anh',
    game: 'Arena Of Valor',
    bio: '280',
    imageUrl:
    'https://topgaixinh.com/wp-content/uploads/2022/09/20220425-Pham-Hong-Nhung-20.jpg',
  ),
];

class TinEmPage extends StatefulWidget {
  const TinEmPage({Key? key}) : super(key: key);

  @override
  State<TinEmPage> createState() => _TinEmPageState();
}

class _TinEmPageState extends State<TinEmPage> {

  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  @override
  void initState() {
    for (int i = 0; i < listGamers.length; i++) {
      _swipeItems.add(SwipeItem(
        content: GamerCard(gamer: listGamers[i]),
        likeAction: () {},
        nopeAction: () {},
        superlikeAction: () {},
      ));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.2),
      body:  Column(
          children: [
            header(),
            Expanded(
              child: SwipeCards(
                matchEngine: _matchEngine!,
                onStackFinished: (){
                },
                itemBuilder: (BuildContext context, int index) {
                  return GamerCard(gamer: listGamers[index]);
                },
              ),
            ),
            likeButton(),
          ],

      ),
    );
  }

  likeButton() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 70,
        vertical: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.brown.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChoiceButton(
            color: Colors.red,
            icon: Icons.clear,
            height: 60,
            size: 30,
          ),
          ChoiceButton(
            color: Colors.white,
            icon: Icons.favorite,
            hasGradient: true,
            height: 60,
          ),
        ],
      ),
    );
  }

  header() {
    return Container(
      margin: EdgeInsets.only(top: 60, bottom: 20),
      // padding: EdgeInsets.only(left: 4),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(
              'assets/images/fire.png',
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text('DISCOVER',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 16),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(32),
            ),
            child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Icon(
                  Icons.turn_right_sharp,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
