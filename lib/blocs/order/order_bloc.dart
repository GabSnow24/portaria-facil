import 'package:bloc/bloc.dart';
import 'package:lobby_chat/blocs/order/order_events.dart';
import 'package:lobby_chat/blocs/order/order_state.dart';
import 'package:lobby_chat/repository/order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final _orderRepo = OrderRepository();

  OrderBloc() : super(OrderInitialState()) {
    on<LoadOrderEvent>((event, emit) =>
        emit(OrderSucessState(orders: _orderRepo.loadOrders())));
    on<AddOrderEvent>((event, emit) =>
        emit(OrderSucessState(orders: _orderRepo.addOrder(event.orders))));
  }
}
