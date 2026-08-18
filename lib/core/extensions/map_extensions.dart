extension MapExtensions on Map {
  bool get paramsHasMorePage => containsKey('page') && this['page'] >= 2;
}

extension NullableMapExtensions on Map? {
  bool get isNotNullAndEmpty => this?.isNotEmpty ?? false;
}
