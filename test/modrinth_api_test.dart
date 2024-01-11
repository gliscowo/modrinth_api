import 'package:modrinth_api/src/errors.dart';
import 'package:modrinth_api/src/models/request_models.dart';
import 'package:modrinth_api/src/models/response_models.dart';
import 'package:modrinth_api/src/modrinth_api_base.dart';
import 'package:modrinth_api/src/routes/search.dart';
import 'package:modrinth_api/src/routes/version_files.dart';
import 'package:test/test.dart';

void main() {
  group('modrinth api', () {
    late ModrinthApi modrinth;
    setUpAll(() {
      modrinth = ModrinthApi.createClient("gliscowo/modrinth_api/test-runner");
    });

    tearDownAll(() => modrinth.dispose());

    test('search', () async {
      await modrinth.search(facets: (Facet.license("MIT") | Facet.license("LGPL-3.0")) & Facet.version("1.17"));
    });

    group('projects', () {
      test('modify project', () async {
        expect(
          modrinth.projects.modify("isometric-renders", ModifyProject(body: "a")),
          throwsA(isA<ModrinthException>()),
        );
      });

      test('get multiple projects', () async {
        expect(
          (await modrinth.projects.getMultiple(["sTZr7NVo", "6udpuGCH"])).map((e) => e.projectType),
          [ModrinthProjectType.mod, ModrinthProjectType.resourcepack],
        );
      });

      test('check slug/id', () async {
        expect(await modrinth.projects.checkIdOrSlug("isometric-renders"), isTrue);
        expect(await modrinth.projects.checkIdOrSlug("greensonichedgehog2026"), isFalse);
        expect(await modrinth.projects.checkIdOrSlug("6QQe8Ldy"), isTrue);
      });

      test('get all dependencies', () async {
        expect(
          (await modrinth.projects.getAllDependencies("alloy-forgery"))!.$1.any((element) => element.slug == "rei"),
          true,
        );
      });

      test('get versions', () async {
        expect(await modrinth.projects.getVersions("owo-lib"), isNotEmpty);
        expect(await modrinth.projects.getVersions("greensonichedgehog2026"), null);
        expect(
          await modrinth.projects.getVersions(
            "alloy-forgery",
            gameVersions: ["1.19"],
            loaders: ["fabric"],
            onlyFeatured: false,
          ),
          isNotEmpty,
        );
      });
    });

    group('versions', () {
      test('get multiple versions', () async {
        expect(await modrinth.versions.getMultiple(["GYl3zwgt", "XheZ9iGK"]), hasLength(2));
        expect(await modrinth.versions.getMultiple([]), isEmpty);
      });

      test('get file from hash', () async {
        expect(
          await modrinth.versionFiles.getVersionFromHash(Hash.sha512(
            "efd542dab1dddaad79b56a352842b1e2e352c221d2f1312f8028168a7ac2a3139c5c9b8c98503720c477e4491c46131effd3e55a7f466c1793f9f37f45cb6110",
          )),
          isNotNull,
        );
      });

      test('latest file from hash', () async {
        expect(
          (await modrinth.versionFiles.getLatestVersionFromHash(
            Hash.sha512(
              "efd542dab1dddaad79b56a352842b1e2e352c221d2f1312f8028168a7ac2a3139c5c9b8c98503720c477e4491c46131effd3e55a7f466c1793f9f37f45cb6110",
            ),
            loaders: [
              "fabric",
            ],
          )),
          isNotNull,
        );

        expect(
          (await modrinth.versionFiles.getLatestVersionFromHash(
            Hash.sha512(
              "efd542dab1dddaad79b56a352842b1e2e352c221d2f1312f8028168a7ac2a3139c5c9b8c98503720c477e4491c46131effd3e55a7f466c1793f9f37f45cb6110",
            ),
            loaders: ["forge"],
          )),
          isNull,
        );
      });

      test('versions from hashes', () async {
        expect(
          (await modrinth.versionFiles.getMultipleVersionsFromHashes([
            Hash.sha512(
              "efd542dab1dddaad79b56a352842b1e2e352c221d2f1312f8028168a7ac2a3139c5c9b8c98503720c477e4491c46131effd3e55a7f466c1793f9f37f45cb6110",
            ),
            Hash.sha512(
              "f5c29b3e054769d9536e0b1178c234b0fa26a0358643ccd5171856841c7948dc73e7a2726cf249a378b11ee8ddedf030d33f7cbeca1fff52d2865afa5ab8ee33",
            )
          ])),
          hasLength(2),
        );
      });

      test('latest versions from hashes', () async {
        expect(
          (await modrinth.versionFiles.getLatestVersionsFromHashes(
            [
              Hash.sha512(
                "efd542dab1dddaad79b56a352842b1e2e352c221d2f1312f8028168a7ac2a3139c5c9b8c98503720c477e4491c46131effd3e55a7f466c1793f9f37f45cb6110",
              ),
              Hash.sha512(
                "f5c29b3e054769d9536e0b1178c234b0fa26a0358643ccd5171856841c7948dc73e7a2726cf249a378b11ee8ddedf030d33f7cbeca1fff52d2865afa5ab8ee33",
              )
            ],
            loaders: [
              "fabric",
            ],
          )),
          hasLength(2),
        );

        expect(
          (await modrinth.versionFiles.getLatestVersionsFromHashes([
            Hash.sha512(
              "efd542dab1dddaad79b56a352842b1e2e352c221d2f1312f8028168a7ac2a3139c5c9b8c98503720c477e4491c46131effd3e55a7f466c1793f9f37f45cb6110",
            ),
            Hash.sha512(
              "f5c29b3e054769d9536e0b1178c234b0fa26a0358643ccd5171856841c7948dc73e7a2726cf249a378b11ee8ddedf030d33f7cbeca1fff52d2865afa5ab8ee33",
            )
          ], loaders: [
            "forge"
          ])),
          isEmpty,
        );
      });
    });

    group('users', () {
      test('get user', () async {
        expect(await modrinth.users.get("qGOpk8Hs"), isNotNull);
        expect(await modrinth.users.get("Noaaan"), isNotNull);
        expect(await modrinth.users.get("greensonichedgehog2026"), isNull);
      });

      test('get multiple users', () async {
        expect(await modrinth.users.getMultiple(["qGOpk8Hs", "bAS54nCE"]), hasLength(2));
      });

      test('get authorized user', () async {
        expect(await modrinth.users.getAuthorizedUser(), isNull);
      });

      test('get user projects', () async {
        expect(await modrinth.users.getProjects("glisco"), hasLength(greaterThan(2)));
      });
    });

    group('teams, tags and misc', () {
      test('get team members', () async {
        var conjuringTeam = await modrinth.teams.getTeam("conjuring");
        expect(conjuringTeam, isNotEmpty);

        expect(await modrinth.teams.getMembers(conjuringTeam.first.teamId), hasLength(equals(conjuringTeam.length)));
      });

      test('tags', () async {
        expect(
          await Future.wait([
            modrinth.tags.getCategories(),
            modrinth.tags.getLoaders(),
            modrinth.tags.getGameVersions(),
            modrinth.tags.getLicenseIdentifiers(),
            modrinth.tags.getDonationPlatforms(),
            modrinth.tags.getReportTypes(),
          ]),
          everyElement(isNotEmpty),
        );
      });

      test('stats', () async {
        await modrinth.fetchStatistics();
      });
    });
  });
}
