import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryModel>(context).history;

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Consultas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(history[index]),
          );
        },
      ),
    );
  }
}

class HistoryModel with ChangeNotifier {
  List<String> _history = [];

  List<String> get history => _history;

  void addRecord(String record) {
    _history.add(record);
    notifyListeners();
  }
}
