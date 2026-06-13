import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiAdaptiveEngine {
  late final GenerativeModel _model;

  AiAdaptiveEngine() {
    final apiKey = dotenv.env['API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception("API kulcs hiányzik a .env fájlból!");
    }

    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  /// ✅ Elemzi a felhasználó válaszát és visszaad egy strukturált eredményt
  Future<Map<String, dynamic>> analyzeResponse(String responseText) async {
    try {
      final prompt = '''
Elemézd a következő párkapcsolati választ:

"$responseText"

⚠️ Fontos:
- Válaszolj KIZÁRÓLAG JSON formátumban
- Ne írj magyarázatot

JSON formátum:
{
  "sentiment": "positive | neutral | negative",
  "depth_score": 0.0-1.0,
  "suggestion": "rövid tanács magyarul",
  "next_category": "mély | szórakoztató"
}
''';

      final response = await _model.generateContent([
        Content.text(prompt),
      ]);

      final text = response.text;

      if (text == null || text.isEmpty) {
        return _fallbackResult();
      }

      // ✅ JSON parse próbálkozás
      return _safeJsonParse(text);
    } catch (e) {
      return _fallbackResult();
    }
  }

  /// ✅ Biztonságos JSON feldolgozás
  Map<String, dynamic> _safeJsonParse(String rawText) {
    try {
      // Gemini néha ```json blokkban adja vissza
      String cleaned =
          rawText.replaceAll("```json", "").replaceAll("```", "").trim();

      final decoded = jsonDecode(cleaned);

      return {
        "sentiment": decoded["sentiment"] ?? "neutral",
        "depth_score": (decoded["depth_score"] ?? 0.5).toDouble(),
        "suggestion": decoded["suggestion"] ?? "Nincs javaslat",
        "next_category": decoded["next_category"] ?? "szórakoztató",
      };
    } catch (e) {
      return _fallbackResult();
    }
  }

  /// ✅ Ha bármi hiba történik
  Map<String, dynamic> _fallbackResult() {
    return {
      "sentiment": "neutral",
      "depth_score": 0.5,
      "suggestion": "Próbálj meg egy kicsit részletesebben válaszolni 💬",
      "next_category": "szórakoztató",
    };
  }
}
