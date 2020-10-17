import 'package:currency_converter/models/serialized/rate.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CurrencyItem extends StatefulWidget {
  final Rate rate;

  String amount;
  CurrencyItem(this.rate, this.amount);

  @override
  _CurrencyItemState createState() => _CurrencyItemState();
}

class _CurrencyItemState extends State<CurrencyItem> {
  @override
  Widget build(BuildContext context) {
    double rate = widget.rate.value *
        double.parse(widget.amount == null || widget.amount == ""
                ? 1.toString()
                : widget.amount)
            .round();
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10),
        child: ListTile(
          // trailing: Text(teste.toString()),
          trailing: Text(rate.roundToDouble().toString()),
          title: Text(widget.rate.currency),
        ),
      ),
    );
  }
}
