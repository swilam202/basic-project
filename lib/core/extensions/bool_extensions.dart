extension NullableBoolExtension on bool? {
  bool get isTrue => this ?? false;
}

extension BoolExtension on bool {
  bool toogle() => !this;
}
