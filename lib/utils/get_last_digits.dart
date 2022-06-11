extension GetLastDigits on String {
  String? getLastDigits() {
    final rx = RegExp(r'(\d+)(?!.*\d)');
    return rx.firstMatch(this)?.group(0);
  }
}
