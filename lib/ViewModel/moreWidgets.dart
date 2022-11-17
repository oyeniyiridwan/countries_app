import 'package:countries_app/Services/countries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilteredSelectionRows extends StatefulWidget {
  String location;
  int index;
  List<String> lists;
  FilteredSelectionRows(
      {required this.lists,
      required this.location,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  State<FilteredSelectionRows> createState() => _FilteredSelectionRowsState();
}

class _FilteredSelectionRowsState extends State<FilteredSelectionRows> {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Countries>(context, listen: true);
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.location,
              style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontWeight: FontWeight.normal),
            ),
            IconButton(
                icon: Icon(count.checks[widget.index]
                    ? Icons.check_box
                    : Icons.check_box_outline_blank),
                onPressed: () {
                  setState(() {
                    count.toggle(widget.index);
                  });
                  if (!count.checks[widget.index]) {
                    widget.lists.removeWhere((a) {
                      return a == widget.location;
                    });
                  } else {
                    widget.lists.add(widget.location);
                  }
                })
          ],
        ),
      ),
    );
  }
}
