import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/provider/app_provider.dart';

class CheckBoxCustom extends StatefulWidget {
  String title;
  bool checkedValue;

  CheckBoxCustom({Key? key, required this.title, required this.checkedValue})
      : super(key: key);

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, app, _) {
      return Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
          checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
        child: CheckboxListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: getProportionateScreenWidth(13),
              color: AppConfig.colors.brightPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),

          activeColor: AppConfig.colors.appPrimaryColor,
          value: widget.checkedValue,
          onChanged: (newValue) {
            setState(() {
              widget.checkedValue = newValue!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
      );
    });
  }
}
