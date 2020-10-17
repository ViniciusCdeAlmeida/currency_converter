import 'package:currency_converter/custom/appDrawer.dart';
import 'package:currency_converter/models/serialized/history.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:currency_converter/providers/authentication.dart';
import 'package:currency_converter/providers/currencies.dart';
import 'package:currency_converter/widgets/history_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<History> userHistory = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) async {
      User _user =
          Provider.of<Authentication>(context, listen: false).actualUser;
      Provider.of<Currencies>(context, listen: false).getUserHistory(_user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    userHistory = Provider.of<Currencies>(context, listen: false).userHistory;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Consumer<Currencies>(
        builder: (context, historyData, child) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: historyData.userHistory.isNotEmpty
                ? ListView.builder(
                    itemCount: historyData.userHistory.length,
                    shrinkWrap: true,
                    itemBuilder: (_, idx) => Column(
                      children: [
                        HistoryItem(
                          historyData.userHistory[idx],
                        ),
                        Divider(),
                      ],
                    ),
                  )
                : !historyData.loading
                    ? Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Stack(
                              children: [
                                Hero(
                                  tag: Text('data'),
                                  child: Image(
                                    image:
                                        AssetImage('assets/icon/history.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 110.0, left: 20.0),
                                  child: Text('No history.'),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
          );
        },
      ),
    );
  }
}
