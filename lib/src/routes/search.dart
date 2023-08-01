import 'package:modrinth_api/src/models/response_models.dart';

class Facet implements FacetOrBlock {
  final String type;
  final String value;

  Facet.category(this.value) : type = "categories";
  Facet.version(this.value) : type = "versions";
  Facet.license(this.value) : type = "license";
  Facet.projectType(ModrinthProjectType type)
      : type = "project_type",
        value = type.name;

  @override
  FacetOrBlock operator |(FacetOrBlock other) => FacetOrBlock._([this, ...other._facets]);

  @override
  FacetAndBlock operator &(FacetOrBlock other) => FacetAndBlock._([this, ...other._blocks]);

  @override
  List<Facet> get _facets => [this];

  @override
  List<FacetOrBlock> get _blocks => [this];
}

class FacetOrBlock implements FacetAndBlock {
  final List<Facet> _facets;
  FacetOrBlock._(this._facets);

  @override
  List<FacetOrBlock> get _blocks => [this];

  FacetOrBlock operator |(FacetOrBlock other) => FacetOrBlock._([..._facets, ...other._facets]);

  @override
  FacetAndBlock operator &(FacetOrBlock other) => FacetAndBlock._([this, ...other._blocks]);
}

class FacetAndBlock {
  final List<FacetOrBlock> _blocks;
  FacetAndBlock._(this._blocks);

  FacetAndBlock operator &(FacetOrBlock other) => FacetAndBlock._([..._blocks, ...other._blocks]);
}

extension QueryString on FacetAndBlock {
  String get queryString =>
      _blocks.map((e) => e._facets.map((e) => "\"${e.type}:${e.value}\"").toList()).toList().toString();
}
