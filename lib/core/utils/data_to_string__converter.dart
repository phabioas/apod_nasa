class DataToStringConverter {
  static String convert(DateTime date) {
    var dateSpllited = date.toString().split(' ');
    return dateSpllited.first;
  }
}
