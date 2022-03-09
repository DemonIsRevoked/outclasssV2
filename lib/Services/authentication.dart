


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outclassv3/CommonPage/multi_dashboard.dart';
import 'package:outclassv3/Pages/welcom.dart';

final auth = FirebaseAuth.instance;
final store = FirebaseFirestore.instance;
class DataController extends GetxController {
  Map userProfileData = {'userName': '', 'role': ''}.obs ;

  @override
  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
      var response = await store
          .collection('Users')
          .where('E-Mail', isEqualTo: auth.currentUser?.email)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.isNotEmpty) {
        userProfileData['userName'] = response.docs[0]['Name'];
        userProfileData['role'] = response.docs[0]['role'];
      }
    }
  }

class UserInstanceManagement {

  handleAuth() {
    Widget page;
    if (auth.currentUser == null) {
      page =   const WelcomePages();
    } else {
      page =  const Dashboard();
    }
    return page;
  }

  handleSignOut(BuildContext context) {
    auth.signOut();
    Get.off(const WelcomePages());
  }

}





