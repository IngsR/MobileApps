import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepository _orderRepository;

  OrdersCubit(this._orderRepository) : super(OrdersInitial());

  Future<void> loadOrders() async {
    emit(OrdersLoading());
    try {
      final orders = await _orderRepository.fetchOrders();
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(const OrdersError('Gagal memuat pesanan'));
    }
  }
}
