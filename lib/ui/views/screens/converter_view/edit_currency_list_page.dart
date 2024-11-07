import 'package:doviz_clone_app/core/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';

class EditCurrencyListPage extends StatefulWidget {
  
  const EditCurrencyListPage({required this.displayedCurrencies, super.key});
  final List<Currency> displayedCurrencies;

  @override
  // ignore: library_private_types_in_public_api
  _EditCurrencyListPageState createState() => _EditCurrencyListPageState();
}

class _EditCurrencyListPageState extends State<EditCurrencyListPage> {
  late List<Currency> editedCurrencies;

  @override
  void initState() {
    super.initState();
    editedCurrencies = List.from(widget.displayedCurrencies);
  }

  void removeCurrency(Currency currency) {
    setState(() {
      editedCurrencies.remove(currency);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listeyi Düzenle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Navigator.pop(context, editedCurrencies),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: editedCurrencies.length,
        itemBuilder: (context, index) {
          final currency = editedCurrencies[index];
          return ListTile(
            title: Text('${currency.currencyName} (${currency.currencySymbolName})'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeCurrency(currency),
            ),
          );
        },
      ),
    );
  }
}
