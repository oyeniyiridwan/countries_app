import 'package:countries_app/view_model/countries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilteredSelectionRows extends StatefulWidget {
  final String location;
  final int index;
  final List<String> lists;
  const FilteredSelectionRows(
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
    final count = Provider.of<CountriesViewModel>(context, listen: true);
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
