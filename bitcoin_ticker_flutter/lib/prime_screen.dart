import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

const apiKey = '92700863-2230-4748-B097-84AAF2C47447';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey';

  // for android
  DropdownButton<String> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      autofocus: true,
      focusColor: Color(0xFF757575),
      elevation: 5,
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          url =
              "https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey";
          getCoinData();
        });
      },
    );
  }

  // for iOS
  CupertinoPicker getiOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItem) {
        selectedCurrency = currenciesList[selectedItem];
        url =
            "https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey";
        getCoinData();
      },
      children: pickerItems,
    );
  }

  Widget getList() {
    if (Platform.isAndroid) {
      return getDropDownItems();
    } else if (Platform.isIOS) {
      return getiOSPicker();
    }
  }

  String bitCurrency;
  String norCurrency;
  int rate;

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  void getCoinData() async {
    CoinData cd = CoinData(url: url);
    var coinData = await cd.getCoinData();
    updateUI(coinData);
  }

  void updateUI(dynamic coinData) {
    setState(() {
      bitCurrency = coinData['asset_id_base'];
      norCurrency = coinData['asset_id_quote'];
      double r = coinData['rate'];
      rate = r.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      appBar: AppBar(
        title: Text(
          '💲 Coin Ticker',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF212121),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFF616161),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 $bitCurrency = $rate $norCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF616161),
            child: getList(),
          ),
        ],
      ),
    );
  }
}
