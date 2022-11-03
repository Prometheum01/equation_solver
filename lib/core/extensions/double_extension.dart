extension CustomDoubleExtension on double {
  double shorted() {
    int index = toString().indexOf('.');

    if (toString().length - (index + 1) >= 4) {
      return double.parse(toString().substring(0, index + 5));
    }

    return this;
  }
}
