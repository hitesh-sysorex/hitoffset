import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hitoffset/src/Auth/model/user_model.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  // final CollectionReference _messagesCollectionReference =
  //     FirebaseFirestore.instance.collection('messages');
  // final FirebaseMessaging _fcm = FirebaseMessaging();

  // final StreamController<List<MessagesModel>> _chatMessagesController =
  //     StreamController<List<MessagesModel>>.broadcast();

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    debugPrint('called');
    try {
      var userData = await _usersCollectionReference.doc(uid).get();

      return UserModel.fromData(userData.data() as Map<String, dynamic>);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getAllUsersOnce() async {
    var currentUserUID = GetStorage().read('id');
    // print(currentUserUID.toString());
    try {
      var usersDocumentSnapshot = await _usersCollectionReference.get();
      // String fcmToken = await _fcm.getToken();

      // final tokenRef = _usersCollectionReference
      //     .document(currentUserUID)
      //     .collection('tokens')
      //     .document(fcmToken);
      // await tokenRef.setData(
      //   TokenModel(token: fcmToken, createdAt: FieldValue.serverTimestamp())
      //       .toJson(),
      // );
      if (usersDocumentSnapshot.docs.isNotEmpty) {
        return usersDocumentSnapshot.docs
            .map((user) =>
                UserModel.fromMap(user.data() as Map<String, dynamic>))
            .where((user) {
          // print(user!.id);
          return user!.id != currentUserUID.toString();
        }).toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  // Future createMessage(MessagesModel message) async {
  //   try {
  //     await _messagesCollectionReference.document().setData(message.toJson());
  //   } catch (e) {
  //     // TODO: Find or create a way to repeat error handling without so much repeated code
  //     if (e is PlatformException) {
  //       return e.message;
  //     }

  //     return e.toString();
  //   }
  // }

  // Stream listenToMessagesRealTime(String friendId, String currentUserId) {
  //   // Register the handler for when the posts data changes
  //   _requestMessages(friendId, currentUserId);
  //   return _chatMessagesController.stream;
  // }

  // void _requestMessages(String friendId, String currentUserId) {
  //   var messagesQuerySnapshot =
  //       _messagesCollectionReference.orderBy('createdAt', descending: true);

  //   messagesQuerySnapshot.snapshots().listen((messageSnapshot) {
  //     if (messageSnapshot.documents.isNotEmpty) {
  //       var messages = messageSnapshot.documents
  //           .map((snapshot) => MessagesModel.fromMap(snapshot.data))
  //           .where((element) =>
  //               (element.receiverId == friendId &&
  //                   element.senderId == currentUserId) ||
  //               (element.receiverId == currentUserId &&
  //                   element.senderId == friendId))
  //           .toList();

  //       _chatMessagesController.add(messages);
  //     }
  //   });
  // }
}
