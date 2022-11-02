// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';
import 'package:medisan/views/owner/own_home/own_topbar.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uuid/uuid.dart';
import '../../../styles/color_palette.dart';
import '../../../styles/fonts.dart';
import 'new_product_event.dart';
import 'new_product_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPageBloc
    extends Bloc<AddProductPageEvent, AddProductPageState> {
  late TextEditingController nameTextEditingController =
      TextEditingController();
  late TextEditingController priceTextEditingController =
      TextEditingController();
  late TextEditingController quantityTextEditingController =
      TextEditingController();
  late TextEditingController descriptionTextEditingController =
      TextEditingController();
  AddProductPageBloc(BuildContext context)
      : super(AddProductPageState.initialState) {
    final storageRef = FirebaseStorage.instance.ref();
    ImagePicker picker = ImagePicker();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var uuid = const Uuid();
    on<AddNewProductEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        var productData = {
          "userID": auth.currentUser!.uid,
          "productID": uuid.v4(),
          "name": event.name,
          "category": event.category,
          "price": event.price,
          "quantity": event.quantity,
          "description": event.description,
          "imageUrl": event.imageUrl,
        };
        await firestore.collection('products').doc(uuid.v4()).set(productData);
        log(productData.toString());
        emit(state.clone(isLoading: false));
        showTopSnackBar(
          context,
          const CustomSnackBar.success(
            backgroundColor: CustomColors.PRIMARY_VARIANT,
            message: "Successfully added item !",
            textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
          ),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const AdminTabBarView()),
          ),
        );
      } catch (e) {
        emit(state.clone(isLoading: false));
        showTopSnackBar(
          context,
          const CustomSnackBar.error(
            backgroundColor: CustomColors.ERROR,
            message: "Something went wrong.",
            textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
          ),
        );
        return Future.error(e.toString());
      }
    });

    on<UploadImageEvent>((event, emit) async {
      var uuid = const Uuid();
      try {
        emit(state.clone(isLoading: true));
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        final imgRef = storageRef.child("${uuid.v4()}.jpg");
        String url = '';
        if (image != null) {
          File imgFile = File(image.path);
          await imgRef.putFile(imgFile);
          url = await imgRef.getDownloadURL();
          log(url.toString());
          emit(state.clone(isLoading: false, imageUrl: url));
        }
      } catch (e) {
        return Future.error(e.toString());
      }
    });
  }
}
