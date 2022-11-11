// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'cust_shopping_cart_event.dart';
import 'cust_shopping_cart_state.dart';

// ADD ALL ITEMS TO THE CART
class ShoppingCartPageBloc
    extends Bloc<ShoppingCartPageEvent, ShoppingCartPageState> {
  ShoppingCartPageBloc(BuildContext context)
      : super(ShoppingCartPageState.initialState) {
    var myCart = [];
    on<AddToCartEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      myCart.add(event.cartItems);
      log('shopping cart items');
      log(myCart.toString());
      emit(state.clone(
          isLoading: false, cartItem: myCart.length, selectItem: myCart));
    });

    on<ClearCartEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      myCart = [];
      emit(state.clone(isLoading: false, cartItem: 0, selectItem: []));
    });
  }
}
