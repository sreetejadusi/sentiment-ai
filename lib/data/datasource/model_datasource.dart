import 'package:sentimentai/data/constants.dart';
import 'package:sentimentai/failure.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

abstract class ModelDataSource {
  Future<Interpreter> loadModel();
}

class ModelDataSourceImpl implements ModelDataSource {
  @override
  Future<Interpreter> loadModel() async {
    try {
      final interpreter = await Interpreter.fromAsset(Constants.model);
      return interpreter;
    } on Exception {
      throw ModelFailure();
    }
  }
}
