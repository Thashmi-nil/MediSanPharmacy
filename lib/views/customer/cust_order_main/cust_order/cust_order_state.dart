import 'package:medisan/models/order_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class CustomerOrderPageState {
  final String error;
  final List<OrderModel> orders;
  final List<OrderModel> adminOrders;
  final bool isLoading;
  final int notification;
  final int adminNotification;

  const CustomerOrderPageState({
    required this.error,
    required this.orders,
    required this.isLoading,
    required this.notification,
    required this.adminNotification,
    required this.adminOrders,
  });
  static CustomerOrderPageState get initialState {
    return const CustomerOrderPageState(
      error: '',
      orders: [],
      isLoading: false,
      notification: 0,
      adminOrders: [],
      adminNotification: 0,
    );
  }

  CustomerOrderPageState clone({
    String? error,
    List<OrderModel>? orders,
    List<OrderModel>? adminOrders,
    bool? isLoading,
    int? notification,
    int? adminNotification,
  }) {
    return CustomerOrderPageState(
      error: error ?? this.error,
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      notification: notification ?? this.notification,
      adminOrders: adminOrders ?? this.adminOrders,
      adminNotification: adminNotification ?? this.adminNotification,
    );
  }
}
