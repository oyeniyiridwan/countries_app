import 'package:flutter/material.dart';

Widget searchL(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Search Country",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    ],
  );
}

Widget card(BuildContext context, String title, Icon icon) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).cardColor),
      borderRadius: BorderRadius.circular(5),
    ),
    borderOnForeground: false,
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    ),
  );
}
