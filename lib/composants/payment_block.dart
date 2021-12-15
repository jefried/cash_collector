import 'package:cash_collector/style/colors.dart';
import 'package:flutter/material.dart';

class PaymentBlock extends StatelessWidget {
  const PaymentBlock({Key? key, this.image = "assets/encaissement/mtn.png", this.active=false}): super(key: key);
  final String image;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return active? Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColorAccent)
      ),
      child: Center(child: _block(),),
    ): _block();
  }

  Widget _block() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
      ),
    );
  }

}