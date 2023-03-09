import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/utils/my_utils.dart';

class BagApplyPage extends StatelessWidget {
  const BagApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: height(context) * 0.1,
        width: width(context) * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            color: const Color(0xFFDEE6E3).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Add Promo Code'),
            Padding(
              padding: EdgeInsets.only(left: width(context) * 0.14),
              child: Container(
                height: height(context) * 0.05,
                width: width(context) * 0.2,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
