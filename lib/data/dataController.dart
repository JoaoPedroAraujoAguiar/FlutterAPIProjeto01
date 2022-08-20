import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:money_search/model/moneyModel.dart';
import 'api.dart';

class DataController {
  final api = API();

  Future<moneyModel?> getMoney() async {
    try {
      final response = await api.get(
          "https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL");
      if (response?.statusCode == 200) {
        return moneyModel.fromJson(json.decode(json.encode(
            response?.data))); //monta um modelo de acordocom o moneyModel
      }
    } catch (e) {
      rethrow;
    }
  }
}
