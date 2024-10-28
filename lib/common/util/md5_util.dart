
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Md5Util{

  static String generateMD5(String input) {
    input = '$input&salt=wX0KebP6!Kn0rm5K##Hhsy8HHA6D8QPH';
    var bytes = utf8.encode(input);
    var digest = md5.convert(bytes);
    return digest.toString();
  }
}