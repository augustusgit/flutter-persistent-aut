import 'dart:convert';

import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LogInBloc extends ChangeNotifier {
  LogInBloc() {
    checkSignIn();
    getLoggedInToken();
    // getDeviceId();
    // getIPAddress();
    // loadProfile();
  }

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isOnboardingRead = false;
  bool get isOnboardingRead => _isOnboardingRead;

  String? _userData;
  String? get userData => _userData;

  String? _userData2;
  String? get userData2 => _userData;

  String? _token;
  String? get token => _token;

  String? _otpID;
  String? get otpID => _otpID;

  String? _registrationID;
  String? get registrationID => _registrationID;

  String? _resetToken;
  String? get resetToken => _resetToken;

  String? _userName;
  String? get userName => _userName;

  String _deviceID = "";
  String get deviceID => _deviceID;

  String _ipAddress = "";
  String get ipAddress => _ipAddress;

  // Profile? _myProfile;
  // Profile? get myProfile => _myProfile;

  int _selectedDrawerItem = 0;
  int get selectedDrawerItem => _selectedDrawerItem;

  Future saveLoggedInToken(String userToken) async {
    EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();

    // final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', userToken);

    _token = userToken;
    notifyListeners();
  }


  Future saveRegistrationID(String regID) async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    await sp.setString('registrationID', regID);
    _registrationID = regID;
    notifyListeners();
  }

  Future saveResetToken(String token) async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    await sp.setString('resetToken', token);
    _resetToken = token;
    notifyListeners();
  }

  Future saveOtpId(String otpID) async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    await sp.setString('otpid', otpID);
    _otpID = otpID;
    notifyListeners();
  }


  getSharedData() async {
    EncryptedSharedPreferences sharedPreferences = await EncryptedSharedPreferences.getInstance();
    String? firstname = sharedPreferences.getString("firstname");
    String? lastname = sharedPreferences.getString("lastname");
    var userName = firstname! + " " + lastname!;
    return userName;
  }

  storeUsername(String value) async {
    EncryptedSharedPreferences sharedPreferences = await EncryptedSharedPreferences.getInstance();
    var x = sharedPreferences.setString("username", value);
    return x;
  }

  storeImage(String value) async {
    EncryptedSharedPreferences sharedPreferences = await EncryptedSharedPreferences.getInstance();
    var x = sharedPreferences.setString("profilePicture", value);
    return x;
  }

  removeData(String key) async {
    EncryptedSharedPreferences sharedPreferences = await EncryptedSharedPreferences.getInstance();
    var x = sharedPreferences.remove(key);
    return x;
  }

  Future getLoggedInToken() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    _token = sp.getString('token');
    notifyListeners();
  }

  Future getOtpIdToken() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    _otpID = sp.getString('otpid');
    notifyListeners();
  }

  Future setSignIn() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    sp.setBoolean('signed_in', true);
    _isSignedIn = true;
    notifyListeners();
  }

  void checkSignIn() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    _isSignedIn = sp.getBoolean('signed_in') ?? false;
    notifyListeners();
  }

  Future setOnboarding() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    sp.setBoolean('isOnboardingRead', true);
    _isOnboardingRead = true;
    notifyListeners();
  }

  void checkOnboardingRead() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    _isOnboardingRead = sp.getBoolean('isOnboardingRead') ?? false;
    notifyListeners();
  }

  Future userSignout() async {
    await clearAllLoggedData().then((value) {
      _isSignedIn = false;
      _token = null;
      _userName = null;
      notifyListeners();
    });
  }

  Future clearAllLoggedData() async {
    final EncryptedSharedPreferences sp = await EncryptedSharedPreferences.getInstance();
    sp.remove("signed_in");
    sp.remove("token");
  }

}
