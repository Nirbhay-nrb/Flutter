import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

const apiKey = 'C7F93412-CB77-457C-AF1A-F09B886A8E58';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  int rate;
  String selectedCurrency = 'USD';
  String url;

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
          setState(() {
            selectedCurrency = value;
            cardCreator();
          });
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
        setState(() {
          setState(() {
            selectedCurrency = currenciesList[selectedItem];
            cardCreator();
          });
        });
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

  @override
  void initState() {
    super.initState();
    cardCreator();
  }

  Future getCoinData(String bitC, String selC) async {
    url = "https://rest.coinapi.io/v1/exchangerate/$bitC/$selC?apikey=$apiKey";
    CoinData cd = CoinData(url: url);
    var coinData = await cd.getCoinData();
    // print(coinData);
    updateUI(coinData);
  }

  void updateUI(dynamic coinData) {
    double r = coinData['rate'];
    rate = r.toInt();
  }

  List<Widget> cards = [];

  void cardCreator() async {
    cards = [];
    for (String bit in cryptoList) {
      await getCoinData(bit, selectedCurrency);
      print('1 $bit = $rate $selectedCurrency');
      var newItem = Card(
        color: Color(0xFF616161),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $bit = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      );
      cards.add(newItem);
    }
    setState(() {});
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
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: cards,
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF424242),
            // Color(0xFF616161)
            child: getList(),
          ),
        ],
      ),
    );
  }
}

/* other way of doing this: 

  (with for loop)
    make three cards under the scaffold ... and in the cardCreator() funciton...
    instead of making the cards ... just store the rates(of all three currencies) inside 
    a list and print those rates in the cards using that list

    or 

  (without for loop)
    make three cards and a function to retrieve the data for one currency and now
    call the function three times for each curreny and then print the rates in the cards 
    in the scaffold
*/