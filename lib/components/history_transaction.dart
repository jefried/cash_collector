import 'package:cash_collector/helpers/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HistoryTransaction extends StatelessWidget {

  final bool success;
  final DateTime dateTime;
  final num amount;
  final String imagePath;
  final String typeTransaction;

  const HistoryTransaction({
    Key? key,
    required this.success,
    required this.dateTime,
    required this.amount,
    required this.imagePath,
    required this.typeTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String transaction = "";
    if (typeTransaction == 'in'){
      transaction = 'Dépôt';
    }
    else if(typeTransaction == 'out'){
      transaction = 'Retrait';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 6),
            blurRadius: 8,            
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                success ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.xmark_circle_fill,
                size: 50,
                color: success ? const Color(0xFF1FB503) : const Color(0xFFED103A),
              ),
              const SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction,
                    style: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontSize: 12,
                      color: Color(0xFF4A4352)
                    ),
                  ),
                  Text(
                    formatMoney(amount, 'fr'),
                    style: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Color(0xFF332E38)
                    ),
                  ),
                  Text(
                    formatDateTime(dateTime, 'fr'),
                    style: TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontSize: 11,
                      color: const Color(0xFF4A4352).withOpacity(0.5)
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill
              ),
              shape: BoxShape.circle
            )
          )
        ],
      ),
    );
  }
}