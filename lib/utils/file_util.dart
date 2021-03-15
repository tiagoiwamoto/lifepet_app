
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class FileUtil {

  static Future<File> getFile(String entidade) async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$entidade.json");
  }

  static Future<void> insertData(String entidade, Map<String, Object> dados) async {

    String data = json.encode(dados);
    final file = await getFile(entidade);
    file.writeAsString(data + '\n', mode: FileMode.append);
  }

  static Future<List<String>> getDataFromFile(String entidade) async {
    final file = await getFile(entidade);
    return file.readAsLines();
  }

}