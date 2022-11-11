import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import 'own_home_event.dart';
import 'own_home_state.dart';

class AdminHomePageBloc extends Bloc<AdminHomePageEvent, AdminHomePageState> {
  AdminHomePageBloc(BuildContext context)
      : super(AdminHomePageState.initialState) {
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
    });
    add(InitEvent());
  }
}
