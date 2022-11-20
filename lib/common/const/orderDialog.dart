import 'package:flutter/material.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/toast_overlay.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../exercise2/graduated_project/tinEm/bottom_navigation_page.dart';
import 'choiceButton.dart';

class OrderDialog extends StatelessWidget {
  const OrderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
                boxShadow:  [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(3, 3)
                  )
                ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Column(
                children: [
                  Text(
                    'CONFIRM TO HIRE HER FOR 1 HOUR',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.withOpacity(0.4),
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
                              height: 40,
                            )),
                        GestureDetector(
                          onTap: (){
                            ToastOverlay(context).show(message: 'Order successfully'
                                '\n'
                                'We will contact you soon');
                            navigatorPush(context, BottomBarPage());
                          },
                          child: ChoiceButton(
                            color: Colors.red,
                            icon: Icons.done,
                            height: 40,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
