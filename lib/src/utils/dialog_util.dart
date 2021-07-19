import 'package:flutter/material.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';

class DialogUtil {
  static void showCustomDialog({
    @required BuildContext context,
    Function onAlertDialogOptionSelected,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext mContext) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(8.0),
              titlePadding: EdgeInsets.all(8.0),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      REGISTERED,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                child: new Text(
                  ACCOUNT_CREATED,
                ),
              ),
              actions: <Widget>[
                new TextButton(
                    onPressed: () {
                      onAlertDialogOptionSelected();
                      Navigator.pop(mContext);

                    },
                    child: new Text(
                      'Ok',
                    ))
              ],
            ),
          );
        });
  }
}
