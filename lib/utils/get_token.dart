import 'package:encrypt_shared_preferences/provider.dart';

getUserToken()async{
  EncryptedSharedPreferences _prefs = await EncryptedSharedPreferences.getInstance();
  var _token = _prefs.getString('token');
  print(_token);

  return _token;
}