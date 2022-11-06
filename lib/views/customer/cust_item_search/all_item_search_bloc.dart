// METHOD SEARCHING ITEM BY NAME FROM THE FIRESTORE DATABASE

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import 'all_item_search_event.dart';
import 'all_item_search_state.dart';

class AllItemSearchPageBloc
    extends Bloc<AllItemSearchPageEvent, AllItemSearchPageState> {
  late TextEditingController searchTextEditingController =
      TextEditingController();
  AllItemSearchPageBloc(BuildContext context)
      : super(AllItemSearchPageState.initialState) {
    on<InitEvent>((event, emit) async {
      try {
        List<ProductModel> products = [];
        List<ProductModel> colorCosmetics = [];
        List<ProductModel> fragrance = [];
        List<ProductModel> hairCare = [];
        List<ProductModel> skinCare = [];
        emit(state.clone(isLoading: true));
        // var data =
        //     await FirebaseFirestore.instance.collection("products").get();

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
        log('all products >> $products');
        emit(state.clone(
          products: products,
          isLoading: false,
          skinCare: skinCare,
          hairCare: hairCare,
          fragrance: fragrance,
          colorCosmetics: colorCosmetics,
        ));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    List<ProductModel> searchList = [];
    on<SearchItemNameEvent>((event, emit) async {
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
      emit(state.clone(isLoading: true));
      log(state.products.toString());
      searchList = state.products
          .where((element) => element.name.contains(event.title))
          .toList();
      var skinSearchList = skinCare
          .where((element) => element.name.contains(event.title))
          .toList();
      var hairSearchList = hairCare
          .where((element) => element.name.contains(event.title))
          .toList();
      var fragranceSearchList = fragrance
          .where((element) => element.name.contains(event.title))
          .toList();
      var colorCosmeticsSearchList = fragrance
          .where((element) => element.name.contains(event.title))
          .toList();
      log('search item');
      log(skinSearchList.toString());
      emit(state.clone(
        isLoading: false,
        searchProducts: searchList,
        skinCare: skinSearchList,
        hairCare: hairSearchList,
        fragrance: fragranceSearchList,
        colorCosmetics: colorCosmeticsSearchList,
      ));
    });
    on<ClearEvent>((event, emit) {
      searchTextEditingController.clear();
    });
    add(InitEvent());
  }
}
