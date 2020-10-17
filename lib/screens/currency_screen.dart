import 'package:currency_converter/custom/appDrawer.dart';
import 'package:currency_converter/providers/currencies.dart';
import 'package:currency_converter/widgets/currency_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  static const routeName = '/currency';
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _amountController = TextEditingController();
  List<String> _currency = ['USD', 'EUR', 'BRL'];
  String _selectedCurrency;

  var amount;

  Future<void> _getRates(String currency) async {
    try {
      await Provider.of<Currencies>(context, listen: false)
          .getCurrency(currency);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var _currentCurrency = Provider.of<Currencies>(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DropdownButton(
                  items: _currency.map((cur) {
                    return DropdownMenuItem(
                      child: Text(cur),
                      value: cur,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCurrency = newValue;
                    });
                  },
                  hint: Text('Currency'),
                  value: _selectedCurrency,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _getRates(_selectedCurrency);
                    });
                  },
                  minWidth: deviceSize.width / 10,
                  color: Color(0xFFFFD185),
                  child: Icon(Icons.search),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: deviceSize.width / 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 2.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    initialValue: "1",
                    onChanged: (value) {
                      setState(() {
                        _currentCurrency.setAmount(value);
                      });
                    },
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: deviceSize.width / 10,
                  color: Color(0xFFFFC200),
                  child: Icon(Icons.save),
                ),
              ),
            ],
          ),
          _currentCurrency.getCurrencies != null
              ? Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Consumer<Currencies>(
                            builder: (ctx, currenciesData, _) =>
                                ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (_, idx) => Column(
                                children: [
                                  CurrencyItem(
                                    currenciesData.getCurrencies.rates[idx],
                                    currenciesData.getAmount,
                                  ),
                                  Divider(),
                                ],
                              ),
                              itemCount:
                                  currenciesData.getCurrencies.rates.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
