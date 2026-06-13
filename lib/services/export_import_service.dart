import 'dart:convert';

class ExportImportService {
  String exportData(Map<String, dynamic> data) {
    return jsonEncode(data);
  }

  Map<String, dynamic> importData(String json) {
    return jsonDecode(json);
  }
}
