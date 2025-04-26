import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String apiKey = 'AIzaSyAkKtXkNqZJGyrKtish9SkjVn-0Dl3czec';
  final String endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

  Future<String> generateContent(String prompt) async {
    final url = Uri.parse('$endpoint?key=$apiKey');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final generatedText =
          data['candidates'][0]['content']['parts'][0]['text'];
      return generatedText;
    } else {
      throw Exception('Failed to generate content: ${response.body}');
    }
  }
}
