import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class SearchPageNotification extends StatelessWidget {
  const SearchPageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width(context) * 0.9,
        height: height(context) * 0.072,
        decoration: BoxDecoration(
            color: const Color(0xFFF1F4F3),
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          cursorHeight: 22,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: width(context) * 0.08, top: height(context) * 0.014),
              border: InputBorder.none,
              hintText: 'Search fresh groceries',
              hintStyle: const TextStyle(height: 1.7, color: Color(0xFFC5C2CD)),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                    top: height(context) * 0.012,
                    right: width(context) * 0.03,
                    left: width(context) * 0.03),
                child: SvgPicture.asset(MyIcons.search),
              )),
        ));
  }
}
