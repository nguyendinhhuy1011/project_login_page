import 'package:flutter/material.dart';
import 'dart:math';
import 'package:homework2/common/const/choiceButton.dart';
import 'package:homework2/common/const/orderDialog.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../../models/gamer_model.dart';
import 'gamerCard.dart';



class TinEmPage extends StatefulWidget {
  const TinEmPage({Key? key}) : super(key: key);

  @override
  State<TinEmPage> createState() => _TinEmPageState();
}

class _TinEmPageState extends State<TinEmPage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<GamerModel> listGamers = [
    GamerModel(
      name: 'Quyen',
      age: '20',
      rating: 4.7,
      rank: 'Tinh Anh',
      game: 'League of Legend',
      bio: '310',
      imageUrl:
      'https://luv.vn/wp-content/uploads/2022/06/gai-xinh-cap-3-luv-15-edited.jpg?v=1655091824',
    ),
    GamerModel(
      name: 'Phuong Anh',
      age: '22',
      rating: 4.8,
      rank: 'Cao Thủ',
      game: 'Mobile Legends',
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
      rank: 'Archon',
      game: 'Dota 2',
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
      imageUrl:
      'http://linkvaobong88ag.vip/wp-content/uploads/2020/11/mie-nguyen-2.jpg',
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
      rank: 'Guardian',
      game: 'Dota 2',
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
      rank: 'Archon',
      game: 'Dota 2',
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
    GamerModel(
      name: 'Jinx',
      age: '18',
      rating: 4.6,
      rank: 'Herald',
      game: 'Dota 2',
      bio: '210',
      imageUrl:
      'https://i.pinimg.com/564x/38/1f/7b/381f7bf002d1da8fc017d7350a137e1a.jpg',
    ),
    GamerModel(
      name: 'Bunny',
      age: '19',
      rating: 4.7,
      rank: 'Kim Cương',
      game: 'Mobile Legends',
      bio: '220',
      imageUrl:
      'https://i.pinimg.com/564x/d1/b5/24/d1b5249f7bbae158a013e53cbcf8bc35.jpg',
    ),
    GamerModel(
      name: 'Minne Pi',
      age: '19',
      rating: 4.7,
      rank: 'Vàng',
      game: 'Free Fire',
      bio: '230',
      imageUrl:
      'https://i.pinimg.com/564x/d0/66/02/d0660256dbd88e2a0dee8e97328c40ec.jpg',
    ),
    GamerModel(
      name: 'Kamii',
      age: '21',
      rating: 4.7,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '250',
      imageUrl:
      'https://i.pinimg.com/564x/5f/5f/8e/5f5f8e65c8748c54e5e025136f62550c.jpg',
    ),
    GamerModel(
      name: 'Anna',
      age: '18',
      rating: 4.6,
      rank: 'Kim Cương',
      game: 'Arena Of Valor',
      bio: '270',
      imageUrl:
      'https://i.pinimg.com/564x/a5/9b/b0/a59bb006e85a95f1bee2fd0859f244bd.jpg',
    ),
    GamerModel(
      name: 'Nda Hong',
      age: '20',
      rating: 4.7,
      rank: 'Vàng',
      game: 'Free Fire',
      bio: '230',
      imageUrl:
      'https://i.pinimg.com/564x/a7/f1/69/a7f1693d9d82dffa5e48f82d4e49e106.jpg',
    ),

    GamerModel(
      name: 'Pe Chanh',
      age: '22',
      rating: 4.8,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '240',
      imageUrl:
      'https://i.pinimg.com/564x/a6/f1/91/a6f1915636854431a652507b4a47991b.jpg',
    ),
    GamerModel(
      name: 'Ngoc Hoa',
      age: '19',
      rating: 4.6,
      rank: 'Vàng',
      game: 'Free fire',
      bio: '250',
      imageUrl:
      'https://i.pinimg.com/564x/89/7d/4f/897d4f3e44e7c9b9d3b3cd4c0f9c615f.jpg',
    ),
    GamerModel(
      name: 'Thuy Linh',
      age: '18',
      rating: 4.6,
      rank: 'Vàng',
      game: 'Mobile Legends',
      bio: '210',
      imageUrl:
      'https://i.pinimg.com/564x/3f/9c/76/3f9c76621557bdf2a507dc217a354571.jpg',
    ),
    GamerModel(
      name: 'Anh Tuyet',
      age: '23',
      rating: 4.7,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '260',
      imageUrl:
      'https://i.pinimg.com/564x/59/f1/1f/59f11fa0a443f1ec0393437cdbdcdacd.jpg',
    ),
    GamerModel(
      name: 'Thao Anh',
      age: '18',
      rating: 4.6,
      rank: 'Sử Thi',
      game: 'Mobile Legends',
      bio: '200',
      imageUrl:
      'https://i.pinimg.com/564x/59/f1/1f/59f11fa0a443f1ec0393437cdbdcdacd.jpg',
    ),
    GamerModel(
      name: 'Chi Dao',
      age: '18',
      rating: 4.7,
      rank: 'Vàng',
      game: 'Free Fire',
      bio: '200',
      imageUrl:
      'https://i.pinimg.com/564x/a6/29/ae/a629aea7588911d7ae1cb5d6cc7ffe50.jpg',
    ),
    GamerModel(
      name: 'Vivi',
      age: '25',
      rating: 4.8,
      rank: 'Vàng',
      game: 'Area Of Valor',
      bio: '250',
      imageUrl:
      'https://afamilycdn.com/fRhOWcbaG01Vd2ydvKbOwEYcba/Image/2016/04/sexy-phong-khoang-do-la-ly-do-ma-5-co-nang-goc-viet-nay-cuc-hot-tren-instagram_20160423131814571.jpg',
    ),
    GamerModel(
      name: 'Pom',
      age: '24',
      rating: 4.7,
      rank: 'Vàng',
      game: 'League Of Legend',
      bio: '240',
      imageUrl:
      'https://i.pinimg.com/564x/8c/0d/2a/8c0d2a070d120ff04e485c02658333f4.jpg',
    ),
    GamerModel(
      name: 'Nhung Deal',
      age: '19',
      rating: 4.6,
      rank: 'Vàng',
      game: 'Free Fire',
      bio: '200',
      imageUrl:
      'https://i.pinimg.com/564x/17/de/83/17de835cc880be5d43c718e99abf6fa2.jpg',
    ),
    GamerModel(
      name: 'Lihn Mew',
      age: '19',
      rating: 4.7,
      rank: 'Bạch Kim',
      game: 'Mobile Legend',
      bio: '210',
      imageUrl:
      'https://i.pinimg.com/564x/e1/54/11/e15411844c424d7d80b8fb4644b3b3bd.jpg',
    ),
    GamerModel(
      name: 'Louis',
      age: '19',
      rating: 4.6,
      rank: 'Kim Cương',
      game: 'Mobile Legend',
      bio: '210',
      imageUrl:
      'https://i.pinimg.com/564x/e7/ef/3e/e7ef3e69b7c6dccb38ef4172692c6c80.jpg',
    ),
    GamerModel(
      name: 'Ha Babie',
      age: '19',
      rating: 4.6,
      rank: 'Vàng',
      game: 'Free Fire',
      bio: '220',
      imageUrl:
      'https://i.pinimg.com/564x/ae/94/58/ae945835b850b76e928d81da958760b3.jpg',
    ),
    GamerModel(
      name: 'Phuong',
      age: '19',
      rating: 4.6,
      rank: 'Vàng',
      game: 'League of Legend',
      bio: '230',
      imageUrl:
      'https://i.pinimg.com/564x/fc/a5/88/fca588b33ddb2c38b81241786b4de158.jpg',
    ),
    GamerModel(
      name: 'Siesta',
      age: '20',
      rating: 4.6,
      rank: 'Kim Cương',
      game: 'Arena Of Valor',
      bio: '240',
      imageUrl:
      'https://i.pinimg.com/564x/09/07/b8/0907b8914c148306e07f7b11214ad09b.jpg',
    ),
    GamerModel(
      name: 'Marin',
      age: '19',
      rating: 4.7,
      rank: 'Bạch Kim',
      game: 'Free Fire',
      bio: '220',
      imageUrl:
      'https://i.pinimg.com/564x/9c/9b/5a/9c9b5a8e93a697b67bb1e6d3a7756959.jpg',
    ),
    GamerModel(
      name: 'Thao Nhi',
      age: '20',
      rating: 4.7,
      rank: 'Sử Thi',
      game: 'Mobile Legend',
      bio: '220',
      imageUrl:
      'https://i.pinimg.com/564x/86/e4/c6/86e4c6dcd22db604813ae4e18788e8e0.jpg',
    ),
    GamerModel(
      name: 'Chi Pea',
      age: '20',
      rating: 4.7,
      rank: 'Sử Thi',
      game: 'Mobile Legend',
      bio: '240',
      imageUrl:
      'https://i.pinimg.com/564x/88/7d/a2/887da2db15e6e78f37d8ea886f3c0ad2.jpg',
    ),
    GamerModel(
      name: 'Shin Cutie',
      age: '23',
      rating: 4.8,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '270',
      imageUrl:
      'https://scontent.fsgn5-11.fna.fbcdn.net/v/t39.30808-6/300968630_181442384403447_1539980116939801848_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=szp8LwtOC3QAX-SE07G&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfCxhKBimPYG22Zl0CbkGPRpMxl6ArVE7lfsWv88uQPAMA&oe=6387D09C',
    ),
    GamerModel(
      name: 'Sunny',
      age: '25',
      rating: 4.9,
      rank: 'Cao Thủ',
      game: 'Arena Of Valor',
      bio: '290',
      imageUrl:
      'https://mtg.1cdn.vn/2017/03/13/images-motthegioi-vn-8443_ban-gai-phan-manh-quynh-10.jpg',
    ),
    GamerModel(
      name: 'Kim Chi',
      age: '27',
      rating: 4.9,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '280',
      imageUrl:
      'https://upload.motgame.vn/photos/motgame-vn/2022/03/vu-ngoc-kim-chi-streamer-sexy.jpg',
    ),
    GamerModel(
      name: 'Samie',
      age: '26',
      rating: 4.9,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '290',
      imageUrl:
      'http://streaming1.danviet.vn/upload/2-2020/images/2020-04-30/ph----ng-anh-1588204211-width650height650.jpg',
    ),
    GamerModel(
      name: 'Van Anh',
      age: '25',
      rating: 4.9,
      rank: 'Tinh Anh',
      game: 'Arena Of Valor',
      bio: '300',
      imageUrl:
      'http://streaming1.danviet.vn/upload/2-2020/images/2020-04-30/vananh1-1588204257-width650height800.jpg',
    ),
    GamerModel(
      name: 'Huyen Babe',
      age: '25',
      rating: 4.9,
      rank: 'Cao Thủ',
      game: 'Arena Of Valor',
      bio: '350',
      imageUrl:
      'https://streaming1.danviet.vn/upload/2-2020/images/2020-04-07/Mac-trang-phuc-ton-vong-1-la-phan-cam-hay-ton-net-dep-troi-ban-92208265_2803930583053997_8869203170996256768_o-1586259750-width1080height1236.jpg',
    ),

  ];

  @override
  void initState() {
    listGamers.shuffle(Random(listGamers.length));
    for (int i = 0; i < listGamers.length; i++) {
      _swipeItems.add(SwipeItem(
        content: GamerCard(gamer: listGamers[i]),
        likeAction: () {
          print('like');
          // if (i == listGamers.length -1){
          //   i = 0;
          //   print('$i');
          // }
        },
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
      backgroundColor: Color.fromRGBO(38, 7, 65, 0.4),
      body: Column(
        children: [
          header(),
          Expanded(
            child: SwipeCards(
              matchEngine: _matchEngine!,
              onStackFinished: () {},
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
      margin: const EdgeInsets.symmetric(
        horizontal: 70,
        vertical: 28,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.brown.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const ChoiceButton(
              color: Colors.red,
              icon: Icons.clear,
              height: 60,
              size: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return OrderDialog();
                  });
            },
            child: const ChoiceButton(
              color: Colors.white,
              icon: Icons.favorite,
              hasGradient: true,
              height: 60,
            ),
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
            padding: EdgeInsets.only(left: 48, right: 28),
            child: Image.asset(
              'assets/images/blue.png',
              height: 50,
              width: 50,
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
          // Container(
          //   margin: EdgeInsets.only(left: 20, right: 16),
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     color: Colors.blueGrey.withOpacity(0.2),
          //     borderRadius: BorderRadius.circular(32),
          //   ),
          //   child: GestureDetector(
          //       onTap: Navigator.of(context).pop,
          //       child: Icon(
          //         Icons.turn_right_sharp,
          //         color: Colors.white,
          //       )),
          // ),
        ],
      ),
    );
  }
}
