import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../models/product_model.dart';
import 'customer_product_list_page_event.dart';
import 'customer_product_list_page_state.dart';

class CustomerProductListPageBloc
    extends Bloc<CustomerProductListPageEvent, CustomerProductListPageState> {
  CustomerProductListPageBloc(BuildContext context)
      : super(CustomerProductListPageState.initialState) {
    on<InitEvent>((event, emit) async {
      try {
        List<ProductModel> products = [];
        List<ProductModel> colorCosmetics = [];
        List<ProductModel> fragrance = [];
        List<ProductModel> hairCare = [];
        List<ProductModel> skinCare = [];
        emit(state.clone(isLoading: true));
        var collection = FirebaseFirestore.instance.collection('products');
        var querySnapshots = await collection.get();
        for (var snapshot in querySnapshots.docs) {
          ProductModel model = ProductModel(
              docID: snapshot.id,
              userId: snapshot.data()['userID'],
              productId: snapshot.data()['productID'],
              name: snapshot.data()['name'],
              productPrice: snapshot.data()['productPrice'],
              productQuantity: snapshot.data()['productQuantity'],
              productType: snapshot.data()['productType'],
              imageUrl: snapshot.data()['imageUrl'],
              aboutProduct: snapshot.data()['aboutProduct']);
          products.add(model);
        }

        for (var c in products) {
          if (c.productType == 'medicine') {
            colorCosmetics.add(c);
          } else if (c.productType == 'healthcare') {
            fragrance.add(c);
          } else if (c.productType == 'labTests') {
            skinCare.add(c);
          } else if (c.productType == 'hair care') {
            hairCare.add(c);
          }
        }
        log(products.length.toString());
        log(products.toString());
        emit(state.clone(
            products: products,
            colorCosmetics: colorCosmetics,
            fragrance: fragrance,
            skinCare: skinCare,
            hairCare: hairCare,
            isLoading: false));
      } catch (e) {
        return Future.error(e.toString());
      }

      var cartItems = [];

      on<cartEvent>((event, emit) {
        emit(state.clone(isLoading: true));
        cartItems.add(event.cartProduct);
        emit(state.clone(isLoading: false, cartItems: cartItems.length));
      });
    });
    on<AddItemCountEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      log(event.itemCount.toString());
      emit(state.clone(isLoading: false, itemCount: event.itemCount));
    });

    on<ClearMainCartEvent>((event, emit) {
      log('call main cart page event');
      emit(state.clone(isLoading: true));
      emit(state.clone(isLoading: false, itemCount: 0, cartItems: 0));
    });

    add(InitEvent());
  }
}
