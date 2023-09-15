import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
//1
  final GroceryItem item;
//2
  final Function(bool?)? onComplete;
  //3
  final TextDecoration textDecoration;
  //4
  GroceryTile({
    super.key,
    required this.item,
    this.onComplete,
  }) : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    // TODO: Change this Widgetw
    return Container(
      height: 100.0,
      // TODO: Replace this color
      color: Colors.red,
    );
  }
  // TODO: Add BuildImportance()

  // TODO: Add BuildDate()

  // TODO: Add buildCheckbox()
}
