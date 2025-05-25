import 'package:encrypt/encrypt.dart' as enc;


class EncryptData {
  static Future<String> encrypt(String input) async {
    const Utf8Key = "9YdHcJz1aOpGZA==";
    final key = enc.Key.fromUtf8(Utf8Key);
    enc.IV iv = enc.IV.fromUtf8(Utf8Key);

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));

    return encrypter.encrypt(input, iv: iv).base64;
  }
}
