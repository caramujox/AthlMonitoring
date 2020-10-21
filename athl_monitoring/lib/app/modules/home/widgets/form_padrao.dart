import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPadrao extends StatelessWidget {
  final String formTitle, formHint;
  final TextEditingController formEditingController;
  final IconData formIcon;

  const FormPadrao(
      {Key key,
      @required this.formTitle,
      @required this.formHint,
      @required this.formEditingController,
      @required this.formIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          formTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            controller: formEditingController,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                formIcon,
                color: ConstColors.ccBlueVioletWheel,
              ),
              hintText: formHint,
              hintStyle: TextStyle(
                color: ConstColors.ccBlueVioletWheel,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
