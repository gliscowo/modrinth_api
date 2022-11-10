import 'dart:io';

import 'package:modrinth_api/src/modrinth_api_base.dart';
import 'package:test/test.dart';

void main() {
  group('main', () {
    ModrinthApi? modrinth;
    setUp(() {
      modrinth = ModrinthApi.createClient("gliscowo/modrinth-api/test-runner");
    });

    test('latest files from hashes', () async {
      print(
          (await modrinth!.latestFilesWithLoaderAndGameVersion([File("deathlog-0.2.9+1.18.jar")], "fabric", "1.19.2"))!
              .map((key, value) => MapEntry(key, value.versionNumber)));
    });

    test('search', () async {
      print((await modrinth!.search("owo-lib")).hits.first.title);
    });
  });
}
