import 'package:test_flutter_zens/app/methods.dart';

class JokeModel {
  JokeModel(this.data);
  final Map<String, dynamic> data;

  String get id => Methods.getString(data, 'id');
  String get title => Methods.getString(data, 'title');
  int get stt => Methods.getInt(data, 'stt');
}
