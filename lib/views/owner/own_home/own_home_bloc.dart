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
        // var data =
        //     await FirebaseFirestore.instance.collection("products").get();
        // for (int i = 0; i < data.docs.length; i++) {
        //   ProductModel model = ProductModel(
        //       userId: data.docs[i].data()['userID'],
        //       productId: data.docs[i].data()['productID'],
        //       name: data.docs[i].data()['name'],
        //       productPrice: data.docs[i].data()['productPrice'],
        //       productQuantity: data.docs[i].data()['productQuantity'],
        //       productType: data.docs[i].data()['productType'],
        //       imageUrl: data.docs[i].data()['imageUrl'],
        //       aboutProduct: data.docs[i].data()['aboutProduct']);
        //   products.add(model);
        // }
        for (var c in products) {
          if (c.productType == 'color cosmetics') {
            colorCosmetics.add(c);
          } else if (c.productType == 'fragrance') {
            fragrance.add(c);
          } else if (c.productType == 'skin care') {
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
