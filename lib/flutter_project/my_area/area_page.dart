import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/navigator.dart';

import 'package:homework2/service/api_service.dart';

import '../../models/area.dart';
import '../my_area/city_page.dart';
import '../my_area/district_dropdown.dart';
import 'select_area_bloc.dart';

class MyAreaPage extends StatefulWidget {
  const MyAreaPage({Key? key}) : super(key: key);

  @override
  State<MyAreaPage> createState() => _MyAreaPageState();
}

class _MyAreaPageState extends State<MyAreaPage> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final streamController = StreamController<List<Area>>();
  late SelectAreaBloc bloc;

  // String? idCitySelected;
  // String? citySelected;
  // final List<Area> listCity = [];

  var isEnable = false;

  var notifier = ValueNotifier<bool>(false);

  @override
  void initState() {

    bloc = SelectAreaBloc();
    bloc.getCities();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    cityController.dispose();
    districtController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Address'),
          leading: Icon(Icons.arrow_back),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                MyTextField2(
                  labelText: 'Full name',
                  hintText: 'Input full name',
                  autoFocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: (_) => validate(),
                ),
                MyTextField2(
                  labelText: 'ID',
                  hintText: 'Input ID',
                  autoFocus: true,
                  keyboardType: TextInputType.phone,
                  onChanged: (_) => validate(),
                ),
                GestureDetector(
                  onTap: () {
                    navigatorPush(context, CityPage(
                      onDone: onDone
                    ));
                  },
                  child: MyTextField2(
                    controller: cityController,
                    labelText: 'City',
                    hintText: 'Select city',
                    enable: false,
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    keyboardType: TextInputType.text,

                    onChanged: (_) => validate(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigatorPush(context, CityPage(onDone: onDone));
                  },
                  child: MyTextField2(
                    controller: districtController,
                    labelText: 'District',
                    hintText: 'Select District',
                    enable: false,
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    keyboardType: TextInputType.text,
                    onChanged: (_) => validate(),
                  ),
                ),
                MyTextField2(
                  labelText: 'Address',
                  hintText: 'Input address(street...)',
                  keyboardType: TextInputType.text,
                  onChanged: (_) => validate(),
                ),
                SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: notifier,
                  builder: (context, value, _) {
                    return MyButton(
                      onTap: () {
                        print('saved');
                      },
                      textButton: 'Save',
                      enable: value,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void validate() {
    final name = nameController.text;
    final id = idController.text;

    if (name.isNotEmpty && id.isNotEmpty) {
      notifier.value = true;
    } else {
      notifier.value = false;
    }
    // provider
    //bloc
    //flutter_bloc
  }


  void onDone(city, district) {
  print('city: ${city.name}');
  print('District: ${district.name} ');

  cityController.text = city.name;
  districtController.text = district.name;
  }
}
