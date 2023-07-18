
import 'dart:convert';
import 'package:crypto/crypto.dart';

class GQLHelper {

    static String hashQuery(String query) {
        var bytes = utf8.encode(query);
        var digest = sha256.convert(bytes);
        return digest.toString();
    }

}