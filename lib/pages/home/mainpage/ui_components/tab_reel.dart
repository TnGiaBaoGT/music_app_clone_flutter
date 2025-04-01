import 'package:flutter/material.dart';
import 'package:musicapp_clone/app_config/theme/app_color.dart';
import 'package:musicapp_clone/data/models/tabs/tab_data.dart';


class TabReel extends StatefulWidget {
  const TabReel({super.key});

  @override
  State<TabReel> createState() => _TabReelState();
}

class _TabReelState extends State<TabReel> {

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final data = TabData();
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.tabData.length,
            itemBuilder: (context, index) {
              final tabdata = data.tabData[index];
              final bool isSelect = isSelected == index;
              return Padding(
                padding: const EdgeInsets.only(right: 40),
                child: GestureDetector(
                  onTap: () {
                    if (isSelected != index) {
                      setState(() {
                        isSelected = index;
                      });
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(tabdata.title,
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                          color: isSelect ? null : const Color(0xff616161),
                      ),),

                      Container(
                        height: 3,
                        width: 28,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: isSelect ? AppColors.primary : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}
