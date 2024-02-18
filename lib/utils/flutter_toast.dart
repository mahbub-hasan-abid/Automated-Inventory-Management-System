import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void showToastMessage(String msg, BuildContext context, bool isSuccess) {
  if (isSuccess) {
    MotionToast.success(
      title: const Text('Success'),
      description: Text(msg),
    ).show(context);
  } else {
    MotionToast.error(
      title: const Text('Error'),
      description: Text(msg),
    ).show(context);
  }
  // // 3.2 use showToastWidget method to custom widget
  // Widget widget = Center(
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(30.0),
  //     child: Container(
  //       width: 40.0,
  //       height: 40.0,
  //       color: Colors.grey.withOpacity(0.3),
  //       child: Icon(
  //         Icons.add,
  //         size: 30.0,
  //         color: Colors.green,
  //       ),
  //     ),
  //   ),
  // );

  // ToastFuture toastFuture = showToastWidget(
  //   widget,
  //   duration: Duration(seconds: 3),
  //   onDismiss: () {
  //     print("the toast dismiss"); // the method will be called on toast dismiss.
  //   },
  // );

  // // can use future
  // Future.delayed(Duration(seconds: 1), () {
  //   toastFuture.dismiss(); // dismiss
  // });

  // Fluttertoast.showToast(
  //     msg: msg,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
}
