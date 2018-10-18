//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

Firestore _database = Firestore.instance;

class MyDatabase {
  Future<void> createUser(name, email, password, country, city, bool is_subscribed) async {
    _database.runTransaction((transaction) async{
      CollectionReference reference = _database.collection('users');
      await reference.add({
        'name': name,
        'email': email,
        'password': password,
        'country': country,
        'city': city,
        'is_subscribed': is_subscribed});
    });
  }

  Future<void> createTestimony(author, body, created_at) async {
    _database.runTransaction((transaction) async{
      CollectionReference reference = _database.collection('cards');
      await reference.add({
        'author': author,
        'body': body,
        'created_at': created_at,
        });
    });
  }

}
//
//class User {
//  final String name;
//  final int age;
//  final dynamic password;
//
//  const User({
//    @required this.name,
//    @required this.age,
//    this.password,
//
//  }) : assert (name != null),
//        assert (age != null);
//
//}

