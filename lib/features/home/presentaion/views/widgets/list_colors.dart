import 'package:flutter/cupertino.dart';

import 'color_item.dart';

class ListColors extends StatefulWidget {
  const ListColors({super.key});

  @override
  State<ListColors> createState() => _ListColorsState();
}

class _ListColorsState extends State<ListColors> {
  int courntIndex = 0;

  get kListColors => null;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 * 2,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              courntIndex = index;

              setState(() {});
            },
            child: ColorItem(
              isChacked: courntIndex == index,
              indexColors: index,
            ),
          );
        },
      ),
    );
  }
}
