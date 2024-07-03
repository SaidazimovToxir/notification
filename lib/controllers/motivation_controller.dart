import 'package:flutter/material.dart';
import 'package:lesson69/models/motivation.dart';
import 'package:lesson69/services/motivation_http_srevices.dart';

class MotivationController extends ChangeNotifier {
  final _motivHttpService = MotivationHttpServices();

  Future<List<MotivationModel>> getMotiv(String quote) async {
    List<MotivationModel> motivation = await _motivHttpService.fetchQuoteData(quote);
    return motivation;
  }
}
