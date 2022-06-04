extension CheckEmpty on String? {
  bool get isNullOrEmpty {
    return this == null || (this != null && this!.isEmpty);
  }
}
