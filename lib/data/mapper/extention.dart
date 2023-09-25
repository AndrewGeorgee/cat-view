import '../../app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constant.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orDouble() {
    if (this == null) {
      return Constant.dzero;
    } else {
      return this!;
    }
  }
}
