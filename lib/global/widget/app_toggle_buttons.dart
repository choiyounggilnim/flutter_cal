import 'package:flutter/material.dart';

class AppToggleButtons extends StatefulWidget {
  final Key? key;
  final String initValue;
  final List<String> stringValues;
  final Function(int index) onPressed;
  final double buttonWidth;
  final double buttonHeight;

  const AppToggleButtons({
    this.key,
    required this.initValue,
    required this.stringValues,
    required this.onPressed,
    this.buttonWidth = 64,
    this.buttonHeight = 48,
  });

  @override
  _AppToggleButtonsState createState() => _AppToggleButtonsState();
}

class _AppToggleButtonsState extends State<AppToggleButtons> {
  late String selectedValue;
  late List<bool> isSelectedList;

  @override
  void initState() {
    selectedValue = widget.initValue;
    isSelectedList = widget.stringValues.map((e) => e == selectedValue).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        constraints: BoxConstraints(
          maxHeight: widget.buttonHeight,
          minHeight: widget.buttonHeight,
        ),
        // selectedColor: m3Color.primaryOverride.get(),
        isSelected: isSelectedList,
        children: widget.stringValues.map((string) {
          return SizedBox(
              width: widget.buttonWidth,
              child: Center(
                  child: Text(
                string,
                textAlign: TextAlign.center,
              )));
        }).toList(),
        onPressed: (index) {
          setState(() {
            for (int buttonIndex = 0; buttonIndex < isSelectedList.length; buttonIndex++) {
              if (buttonIndex == index) {
                isSelectedList[buttonIndex] = true;
              } else {
                isSelectedList[buttonIndex] = false;
              }
            }

            widget.onPressed(index);
          });
        });
  }
}
