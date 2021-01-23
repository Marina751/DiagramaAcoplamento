import 'dart:async';
import 'dart:io';

import 'package:freckt_fretista/utils/responses/default_response.dart';
import 'package:freckt_fretista/utils/responses/response_builder.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  const LocalStorage(this.fileName);

  final String fileName;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName.txt');
  }

  Future<DefaultResponse<String>> readContent() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      if (contents.isEmpty) {
        return ResponseBuilder.failed<String>(message: 'Arquivo vazio.');
      }

      return ResponseBuilder.success<String>(object: contents);
    } catch (e) {
      return ResponseBuilder.failed<String>(message: e.toString());
    }
  }

  Future<File> writeContent(String contents) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(contents);
  }
}
