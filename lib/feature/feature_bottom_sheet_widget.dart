import 'package:bloc_kickoff/common/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureBottomSheetWidget extends StatefulWidget {
  const FeatureBottomSheetWidget({
    Key key,
  }) : super(key: key);

  @override
  _FeatureBottomSheetState createState() => _FeatureBottomSheetState();
}

class _FeatureBottomSheetState extends State<FeatureBottomSheetWidget> {
  final _dailyGoalController = TextEditingController();
  final _gailyGoalFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        controller: _dailyGoalController,
                        focusNode: _gailyGoalFocusNode,
                        autofocus: true,
                        style: GoogleFonts.sourceSansPro(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.sourceSansPro(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                          ),
                          labelText: 'Hello there! Say something nice!',
                          hintText: 'here 👉',
                          hintStyle: GoogleFonts.sourceSansPro(
                            color: Colors.grey,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      onPressed: () {
                        Navigator.pop(context, _dailyGoalController.text);
                      },
                      color: ColorPalette.of(context).lightGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
