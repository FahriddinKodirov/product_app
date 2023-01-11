import 'package:flutter/material.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_utils.dart';

class AccountSwitch extends StatefulWidget {
  final String wordLineOne;
  final String wordLineTwo;
  bool isTrue;

 AccountSwitch({super.key, 
                required this.wordLineOne,
                required this.wordLineTwo,
                required this.isTrue,});

  @override
  State<AccountSwitch> createState() => _AccountSwitchState();
}

class _AccountSwitchState extends State<AccountSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context)*0.05,top: height(context)*0.02),
      child: Stack(
        children: [
          Container(
            height: height(context) * 0.09,
            width: width(context)* 0.9,
            decoration: BoxDecoration(
                color: const Color(0xFFF1F3F2), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.054, top: height(context) * 0.02),
                      child: Text(
                        widget.wordLineOne,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.058, top: height(context) * 0.006),
                      child: Text(
                        widget.wordLineTwo,
                        style: const TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          Positioned(
            left: width(context)*0.72,
            top: height(context)*0.014,
            child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: MyColors.C_53E88B,
                  inactiveTrackColor: Color(0xFFE2E2E2),
                  value: widget.isTrue,
                  onChanged: (value) {
                    setState(() {
                      widget.isTrue = value;
                    });
                  },
                ))
        ],
      ),
    );
  }
}