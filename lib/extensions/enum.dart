extension EnumToString on Enum {
   String currentValue() {
    return toString().split('.').last;
  }
}
