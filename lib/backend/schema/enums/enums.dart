import 'package:collection/collection.dart';

enum PickType {
  NORM,
  BINNY,
}

enum TeamSelected {
  home,
  away,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (PickType):
      return PickType.values.deserialize(value) as T?;
    case (TeamSelected):
      return TeamSelected.values.deserialize(value) as T?;
    default:
      return null;
  }
}
