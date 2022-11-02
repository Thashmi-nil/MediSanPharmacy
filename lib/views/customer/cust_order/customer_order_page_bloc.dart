import 'dart:convert';
import 'dart:developer';
import 'package:medisan/models/order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'customer_order_page_event.dart';
import 'customer_order_page_state.dart';
import 'package:http/http.dart' as http;

class CustomerOrderPageBloc
    extends Bloc<CustomerOrderPageEvent, CustomerOrderPageState> {
  CustomerOrderPageBloc(BuildContext context)
      : super(CustomerOrderPageState.initialState) {
    FirebaseAuth auth = FirebaseAuth.instance;
    late http.Response response;
    on<InitEvent>((event, emit) async {
      log('call the order function');
      var myList = [];
      try {
        emit(state.clone(isLoading: true));
        const url =
            'https://pharmacyapp-50403-default-rtdb.firebaseio.com/order.json';
        response = await http.get(Uri.parse(url));
        Map body = jsonDecode(response.body);

        body.forEach((k, v) {
          v['mainID'] = k;
          log(v.toString());
          myList.add(v);
        });
        List<OrderModel> orders = [];
        List<OrderModel> allOrders = [];
        for (var item in myList) {
          OrderModel orderModel = OrderModel(
            city: item['address']['city'],
            name: item['address']['name'],
            phone: item['address']['phone'],
            address: item['address']['addressLineOne'],
            customerId: item['customerID'],
            mainID: item['mainID'],
            date: item['date'],
            total: item['total'],
            orderId: item['orderID'],
            products: item['products'],
          );
          allOrders.add(orderModel);
          if (item['customerID'] == auth.currentUser!.uid) {
            OrderModel orderModel = OrderModel(
              city: item['address']['city'],
              name: item['address']['name'],
              phone: item['address']['phone'],
              address: item['address']['addressLineOne'],
              customerId: item['customerID'],
              mainID: item['mainID'],
              date: item['date'],
              total: item['total'],
              orderId: item['orderID'],
              products: item['products'],
            );
            orders.add(orderModel);
          }
        }
        emit(state.clone(
            isLoading: false,
            orders: orders,
            adminOrders: allOrders,
            adminNotification: allOrders.length,
            notification: orders.length));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
  }
}
