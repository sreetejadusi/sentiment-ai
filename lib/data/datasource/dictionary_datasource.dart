import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sentimentai/data/constants.dart';
import 'package:sentimentai/failure.dart';

abstract class DictionaryDataSource {
  Future<Map<String, dynamic>> getDictionary();
}

class DictionaryDataSourceImpl implements DictionaryDataSource {
  @override
  Future<Map<String, dynamic>> getDictionary() async {
    try {
      final file = await rootBundle.loadString(Constants.dictionary);
      final json = jsonDecode(file) as Map<String, dynamic>;
      final dictionary =
          jsonDecode(json['config']['word_index']) as Map<String, dynamic>;
      return dictionary;
    } on Exception {
      throw DictionaryFailure();
    }
  }
}
