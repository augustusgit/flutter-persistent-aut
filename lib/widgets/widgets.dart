
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

void dmsNotice(BuildContext context, String responseText) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(
        responseText,
        style: TextStyle(
            color: appTextColorPrimary,
            fontWeight: FontWeight.bold,
            fontSize:
            18), //boldTextStyle(color: appStore.textPrimaryColor, size: 18),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'Ok',
            style: primaryTextStyle(color: Colors.red, size: 18),
          ),
          onPressed: () {
            finish(context);
          },
        ),
      ],
    ),
  );
}

TextFormField zercomFormField({
  required BuildContext context,
  required TextEditingController controller,
  required FocusNode focusNode,
  required String hintText,
  required TextInputType keyboardType,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  bool autofocus = false,
  bool showSuffix = false,
  bool visibilityon = true,
  void Function()? obscureFunction,
}) {
  final _screenHeight = MediaQuery.of(context).size.height;
  final _screenWidth = MediaQuery.of(context).size.width;
  return TextFormField(
    keyboardType: keyboardType,
    autofocus: autofocus,
    controller: controller,
    textCapitalization: TextCapitalization.words,
    onEditingComplete: () {
      controller.text = controller.text.trim();
    },
    style: TextStyle(
        color: appColorPrimary,
        fontFamily: "Regular",
        fontSize: _screenHeight / 50),
    decoration: InputDecoration(
      suffixIcon: showSuffix
          ? Padding(
        padding: EdgeInsets.only(right: _screenWidth * .01),
        child: InkWell(
          onTap: obscureFunction,
          child: Icon(
              visibilityon ? Icons.visibility : Icons.visibility_off),
        ),
      )
          : null,
      filled: true,
      fillColor: inputBackgroundColor,
      focusColor: inputBorderColor,
      hintText: hintText,
      hintStyle: TextStyle(
          color: appColorPrimary,
          fontFamily: "Regular",
          fontSize: _screenHeight / 50),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: inputBorderColor, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              color: iconColorSecondary, style: BorderStyle.solid, width: 1)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              color: iconColorSecondary, style: BorderStyle.solid, width: 1)),
    ),
    textInputAction: TextInputAction.next,
    focusNode: focusNode,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    obscureText: showSuffix && visibilityon ? true : false,
  );
}

TextFormField zercomFormFieldPWD({
  required BuildContext context,
  required TextEditingController controller,
  required FocusNode focusNode,
  required String hintText,
  required TextInputType keyboardType,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  Function()? showPass,
  bool autofocus = false,
  bool isObscure = true,
}) {
  final _screenHeight = MediaQuery.of(context).size.height;
  return TextFormField(
    obscureText: isObscure,
    keyboardType: keyboardType,
    autofocus: autofocus,
    controller: controller,
    textCapitalization: TextCapitalization.words,
    style: TextStyle(
        color: appColorPrimary,
        fontFamily: "Regular",
        fontSize: _screenHeight / 50),
    decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(
          isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: Color.fromRGBO(196, 196, 196, 1),
          size: _screenHeight * .0248,
        ),
        onPressed: showPass,
      ),
      filled: true,
      fillColor: inputBackgroundColor,
      focusColor: inputBorderColor,
      hintText: hintText,
      hintStyle: TextStyle(
          color: appColorPrimary,
          fontFamily: "Regular",
          fontSize: _screenHeight / 50),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: inputBorderColor, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              color: iconColorSecondary, style: BorderStyle.solid, width: 1)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              color: iconColorSecondary, style: BorderStyle.solid, width: 1)),
    ),
    textInputAction: TextInputAction.next,
    focusNode: focusNode,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
  );
}


void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}