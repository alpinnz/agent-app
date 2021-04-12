  
String generateTimeStamp() {
  DateTime dateTime = DateTime.now();
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  String day = dateTime.day.toString();
  String hour = dateTime.hour.toString();
  String minute = dateTime.minute.toString();
  String second = dateTime.second.toString();

  return (year + month + day + hour + minute + second);
}