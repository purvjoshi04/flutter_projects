import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  //1
  final Function(GroceryItem) onCreate;
  //2
  final Function(GroceryItem) onUpdate;
  //3
  final GroceryItem? originalItem;
  //4
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);
  @override
  GroceryItemScreenState createState() => GroceryItemScreenState();
}

class GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameContorller = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    //1
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameContorller.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }
//2
    _nameContorller.addListener(() {
      setState(() {
        _name = _nameContorller.text;
      });
    });
  }

  @override
  void dispose() {
    _nameContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      //2
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Add callback handler
              },
              icon: Icon(Icons.check))
        ],
        //3
        elevation: 0.0,
        //4
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      //5
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
           buildNameField(),
            // TODO: Add Importance selection
            // TODO: Add date picker
            // TODO: Add time picker
            // TODO: Add color picker
            // TODO: Add slider
            // TODO: Add Grocery Tile
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    //1
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //3
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        //4
        TextField(
          //5
          controller: _nameContorller,
          //6
          cursorColor: _currentColor,
          //7
          decoration: InputDecoration(
            //8
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            // 9
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
      ],
    );
  }
// TODO: Add buildImportanceField()
// TODO: ADD buildDateField()
// TODO: Add buildTimeField()
// TODO: Add buildColorPicker()
// TODO: Add buildQuantityField()
}
