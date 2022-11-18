import 'package:lobby_chat/models/message_model.dart';
import 'package:lobby_chat/models/order_model.dart';

class OrderRepository {
  final List<Order> _orders = [];

  List<Order> loadOrders() {
    _orders.addAll([
      Order(
          trackingCode: 'ABCDERFE1231',
          receiveDate: '10/10/2022',
          owner: adryUser,
          id: 1,
          name: 'Lixo',
          orderPhotoUrl: 'assets/images/pacote.jpg',
          receivedByOwner: true)
    ]);
    return _orders;
  }

  List<Order> addOrder(Order order) {
    _orders.add(order);
    return _orders;
  }
}
