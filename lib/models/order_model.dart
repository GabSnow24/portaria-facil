import 'package:lobby_chat/models/user_model.dart';

class Order {
  final int id;
  final String name;
  final String trackingCode;
  final String receiveDate;
  final String orderPhotoUrl;
  final bool receivedByOwner;
  final User owner;

  Order({
    required this.trackingCode,
    required this.receiveDate,
    required this.owner,
    required this.id,
    required this.orderPhotoUrl,
    required this.receivedByOwner,
    required this.name,
  });
}
