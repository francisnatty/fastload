import 'package:fastload/Screens/airtime/model/popup_model.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';

class NetworkPopUp extends StatefulWidget {
  const NetworkPopUp({
    super.key,
  });

  @override
  State<NetworkPopUp> createState() => _NetworkPopUpState();
}

class _NetworkPopUpState extends State<NetworkPopUp> {
  PopupMenuItemModel? selectedMenuItem;
  String initialImage = Images.mtn;
  final List<PopupMenuItemModel> menuItems = [
    PopupMenuItemModel(title: 'mtn', imagePath: Images.mtn),
    PopupMenuItemModel(title: 'glo', imagePath: Images.glo),
    PopupMenuItemModel(title: 'airtel', imagePath: Images.airtel),
    PopupMenuItemModel(title: '9mobile', imagePath: Images.mobile),
  ];
  void _onMenuItemSelected(PopupMenuItemModel menuItem) {
    setState(() {
      selectedMenuItem = menuItem;
    });
    setState(() {
      initialImage = menuItem.imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: CircleAvatar(backgroundImage: Image.asset(initialImage).image),
        ),
        PopupMenuButton<PopupMenuItemModel>(
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            onSelected: _onMenuItemSelected,
            itemBuilder: (context) {
              return menuItems.map((e) {
                return PopupMenuItem<PopupMenuItemModel>(
                    child: Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: Image.asset(e.imagePath).image,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(e.title)
                  ],
                ));
              }).toList();
            }),
      ],
    );
  }
}
