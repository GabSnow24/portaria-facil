import 'package:lobby_chat/models/order_model.dart';

abstract class OrderState {
  List<Order> orders;

  OrderState({required this.orders});
}

class OrderInitialState extends OrderState {
  OrderInitialState() : super(orders: []);
}

class OrderSucessState extends OrderState {
  OrderSucessState({required List<Order> orders}) : super(orders: orders);
}
