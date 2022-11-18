import 'package:lobby_chat/models/order_model.dart';

abstract class OrderEvent {}

class LoadOrderEvent extends OrderEvent {}

class AddOrderEvent extends OrderEvent {
  Order orders;

  AddOrderEvent({
    required this.orders,
  });
}
