// import 'dart:convert';
// import 'package:crypto/crypto.dart';

// String generateMd5(String input) {
//   return md5.convert(utf8.encode(input)).toString();
// }

// String generateHash(String privateKey, String publicKey) {
//   final ts = DateTime.now().millisecondsSinceEpoch.toString();
//   final preHash = ts + privateKey + publicKey;
//   final hash = generateMd5(preHash);
//   return hash;
// }

// // Ejemplo de uso
// final privateKey = '7eadb0c21fdd448734ea22fc0f75d13cd5c4a4cc';
// final publicKey = '41defd33e930b5c61350563064651f7d';
// final hash = generateHash(privateKey, publicKey);
// print('Hash generado: ${hash}');
