import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String mobileNumber;
  String name;
  String email;
  String emailReal;
  String profile;
  Timestamp timestamp;
  String uid;
  UserModel({
        this.name,
        this.mobileNumber,
        this.email,
        this.emailReal,
        this.timestamp,
        this.uid,
         this.profile
  });


  toMap() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'profile': profile,
      'email': email,
      'uid': uid,
      'timestamp': FieldValue.serverTimestamp()
    };
  }
  factory UserModel.fromMap(Map map) {
    return UserModel(
      name: map["name"],
      mobileNumber: map["mobileNumber"],
      profile: map["profile"],
      email: map["email"],
      timestamp: map["timestamp"],
      uid: map["uid"],
    );
  }
}

class UserState {
  bool addFriend = true;
  bool notification = true;
  String language = 'english';
  UserState({
        this.addFriend,
        this.language,
    this.notification
  });


  toMap() {
    return {
      'addFriend': addFriend,
      'language': language,
      'notification': notification
    };
  }
  factory UserState.fromMap(Map map) {
    return UserState(
      addFriend: map["addFriend"],
      language: map["language"],
      notification: map["notification"],
    );
  }
}