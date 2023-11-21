import 'dart:convert';

class JwtDecoder {
  static Map<String, dynamic> decode(String token) {
    final splitToken = token.split(".");
    if (splitToken.length != 3) {
      throw const FormatException("Invalid token");
    }
    try {
      final payloadBase64 = splitToken[1];
      final normalizedPayload = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      final decodedPayload = jsonDecode(payloadString);
      return decodedPayload;
    } catch (error) {
      throw const FormatException("Invalid payload");
    }
  }
}
