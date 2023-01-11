import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class SearchPageSearch extends StatefulWidget {
  final VoidCallback onClicaction;

  const SearchPageSearch({super.key, required this.onClicaction});

  @override
  State<SearchPageSearch> createState() => _SearchPageSearchState();
}

class _SearchPageSearchState extends State<SearchPageSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: width(context) * 0.7,
            height: height(context) * 0.072,
            decoration: BoxDecoration(
                color: const Color(0xFFF1F4F3),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              cursorHeight: 22,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search fresh groceries',
                  hintStyle: const TextStyle(height: 1.7),
                  icon: Padding(
                      padding: EdgeInsets.only(
                          left: width(context) * 0.05,
                          top: height(context) * 0.01),
                      child: SvgPicture.asset(MyIcons.search))),
            )),
        InkWell(
          onTap: () {
            widget.onClicaction();
          },
          child: SvgPicture.asset(
            MyIcons.searchPage,
            width: 58,
          ),
        ),
      ],
    );
  }
}
