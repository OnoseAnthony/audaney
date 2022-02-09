

String? enumToString(val) {
  return val.toString().split(".").last;
}

T? enumFromString<T>(Iterable<T?> values, String? value) {
  if (value == null) {
    return null;
  } else {
    for (var enumValue in values) {
      if (enumValue.toString().split(".").last == value) return enumValue;
    }
    return null;
  }
}