import 'package:chatapp/constant.dart';

class Massage {
  String massagetext;
  Massage(this.massagetext);

  factory Massage.fromjson(jsonData) {
    return Massage(jsonData[kmassage]);
  }
}
