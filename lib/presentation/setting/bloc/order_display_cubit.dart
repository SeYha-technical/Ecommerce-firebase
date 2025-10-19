import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/order/usecases/get_order.dart';
import '../../service_locator.dart';
import 'order_display_state.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersLoading());

  void displayOrders() async {
    var returnedData = await sl<GetOrderUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadOrdersFailure(errorMessage: error));
      },
      (orders) {
        emit(OrdersLoaded(orders: orders));
      },
    );
  }
}
