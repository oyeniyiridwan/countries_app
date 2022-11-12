import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

bool region = false;
bool subRegion = false;
bool capital = false;
bool currency = false;

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 450,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter"),
                  IconButton(
                    icon: Icon(Icons.dangerous_sharp),
                    onPressed: () {
                      region = false;
                      subRegion = false;
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Region"),
                  IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        region = !region;
                      });
                    },
                  )
                ],
              ),
            ),
            if (region)
              Column(
                children: [
                  continentList(
                      context, "Africa", Icon(Icons.check_box_outline_blank)),
                  continentList(context, "Antarctica",
                      Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "Asia", Icon(Icons.check_box_outline_blank)),
                  continentList(context, "Australia",
                      Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "Europe", Icon(Icons.check_box_outline_blank)),
                  continentList(context, "North America",
                      Icon(Icons.check_box_outline_blank)),
                  continentList(context, "South America",
                      Icon(Icons.check_box_outline_blank)),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub Region"),
                  IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        subRegion = !subRegion;
                      });
                    },
                  )
                ],
              ),
            ),
            if (subRegion)
              Column(
                children: [
                  continentList(
                      context, "GMT+1:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+2:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+3:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+4:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+5:00", Icon(Icons.check_box_outline_blank)),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Capital"),
                  IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        capital = !capital;
                      });
                    },
                  )
                ],
              ),
            ),
            if (capital)
              Column(
                children: [
                  continentList(
                      context, "GMT+1:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+2:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+3:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+4:00", Icon(Icons.check_box_outline_blank)),
                  continentList(
                      context, "GMT+5:00", Icon(Icons.check_box_outline_blank)),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Currency"),
                  IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        currency = !currency;
                      });
                    },
                  )
                ],
              ),
            ),
            if (currency)
              Column(children: [
                continentList(
                    context, "GMT+1:00", Icon(Icons.check_box_outline_blank)),
                continentList(
                    context, "GMT+2:00", Icon(Icons.check_box_outline_blank)),
                continentList(
                    context, "GMT+3:00", Icon(Icons.check_box_outline_blank)),
                continentList(
                    context, "GMT+4:00", Icon(Icons.check_box_outline_blank)),
                continentList(
                    context, "GMT+5:00", Icon(Icons.check_box_outline_blank)),
              ]),
            if (region || subRegion)
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).cardColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    borderOnForeground: false,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          "Reset",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    borderOnForeground: false,
                    color: Colors.deepOrange,
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: Center(
                        child: Text(
                          "Show results",
                          style:
                              TextStyle(color: Theme.of(context).canvasColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

Widget continentList(BuildContext context, String continent, Icon icon) {
  return SizedBox(
    height: 35,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            continent,
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          IconButton(icon: icon, onPressed: () {})
        ],
      ),
    ),
  );
}
