class BookingModel {
  String numberOfPassengers;
  String busRouteNumber;
  String userId;
  DateTime date;
  String time;
  double totalAmount;

  BookingModel({
    required this.numberOfPassengers,
    required this.busRouteNumber,
    required this.userId,
    required this.date,
    required this.time,
    required this.totalAmount,
  });
}
