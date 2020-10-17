import 'package:currency_converter/models/serialized/history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryItem extends StatefulWidget {
  final History history;

  HistoryItem(this.history);

  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
                'Searched at: ${DateFormat('dd/MM/yyyy hh:mm').format(widget.history.savedDate)}'),
            trailing: IconButton(
              icon: Icon(
                (_expanded ? Icons.expand_less : Icons.expand_more),
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.history.rates.length,
                      itemBuilder: (ctx, idx) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.history.rates[idx].currency}: ${widget.history.rates[idx].value}',
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
