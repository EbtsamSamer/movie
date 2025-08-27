import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseConnector {
  showLoading();

  showErrorMessage({String? message});

  showSuccessDialog();
}

abstract class BaseViewModel<T extends BaseConnector> extends ChangeNotifier {
  T? connector;
}

abstract class BaseView<st extends StatefulWidget, T extends BaseViewModel>
    extends State<st> implements BaseConnector {
  T? viewModel;
  T initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel(); //initialize object
  }
  @override
  showErrorMessage({String? message}) {
    showDialog(
      context: context, builder: (context) =>
        AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: Text("Error", style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
          content: Text(
            message?? " ", style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Okay", style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
            )
          ],
        ),);
  }

  @override
  showLoading() {
    showDialog(
      context: context, builder: (context) =>
        AlertDialog(
          backgroundColor: Colors.blueGrey,
          content: Center(child: CircularProgressIndicator(color: Colors.blue,))

        ),);
  }

  @override
  showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Success",
          style: GoogleFonts.inter(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Okay",
              style: GoogleFonts.inter(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
