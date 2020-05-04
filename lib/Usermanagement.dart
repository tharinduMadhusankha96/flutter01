import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserManagement{
  storeNewUser(user, context){
    Firestore.instance.collection('doctors').add({
      'email' : user.email,
      'uid' : user.uid
    }).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/viewPage');
    }).catchError((e){
      print(e);
    });
  }

}