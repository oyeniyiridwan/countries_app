import 'package:countries_app/View/countries.dart';
import 'package:countries_app/ViewModel/moreUseable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

bool region = false;
bool subRegion = false;
bool capital = false;
bool currency = false;

// List<String> regionL = [];
// List<String> subRegionL = [];
// List<String> capitalL = [];
// List<String> currencyL = [];

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Countries>(context, listen: true);
    final boolData = count.checks;
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
                  Text(
                    "Filter",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.dangerous_sharp,
                      color: Colors.grey,
                    ),
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
                  const Text(
                    "Region",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  IconButton(
                    icon: Icon(
                      region ? Icons.expand_less : Icons.expand_more,
                    ),
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
                  FilteredSelectionRows(
                      index: 0, lists: count.regionL, location: "Africa"),
                  FilteredSelectionRows(
                      index: 1, lists: count.regionL, location: "Americas"),
                  FilteredSelectionRows(
                      index: 2, lists: count.regionL, location: "Antarctic"),
                  FilteredSelectionRows(
                      index: 3, lists: count.regionL, location: "Asia"),
                  FilteredSelectionRows(
                      index: 4, lists: count.regionL, location: "Europe"),
                  FilteredSelectionRows(
                      index: 5, lists: count.regionL, location: "Oceania"),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sub Region",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )),
                  IconButton(
                    icon:
                        Icon(subRegion ? Icons.expand_less : Icons.expand_more),
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
                  FilteredSelectionRows(
                      index: 6,
                      lists: count.subRegionL,
                      location: "Australia and New Zealand"),
                  FilteredSelectionRows(
                      index: 7, lists: count.subRegionL, location: "Caribbean"),
                  FilteredSelectionRows(
                      index: 8,
                      lists: count.subRegionL,
                      location: "Eastern Africa"),
                  FilteredSelectionRows(
                      index: 9,
                      lists: count.subRegionL,
                      location: "Northern Europe"),
                  FilteredSelectionRows(
                      index: 10,
                      lists: count.subRegionL,
                      location: "South America"),
                  FilteredSelectionRows(
                      index: 11,
                      lists: count.subRegionL,
                      location: "South Asia"),
                  FilteredSelectionRows(
                      index: 12,
                      lists: count.subRegionL,
                      location: "South Eastern Asia")
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Capital",
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  IconButton(
                    icon: Icon(capital ? Icons.expand_less : Icons.expand_more),
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
                  FilteredSelectionRows(
                      index: 13, lists: count.capitalL, location: "Islamabad"),
                  FilteredSelectionRows(
                      index: 14, lists: count.capitalL, location: "Lusaka"),
                  FilteredSelectionRows(
                      index: 15, lists: count.capitalL, location: "Oslo"),
                  FilteredSelectionRows(
                      index: 16, lists: count.capitalL, location: "Podgorica")
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Currency",
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  IconButton(
                    icon:
                        Icon(currency ? Icons.expand_less : Icons.expand_more),
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
                FilteredSelectionRows(
                    index: 17, lists: count.currencyL, location: "Euro"),
                FilteredSelectionRows(
                    index: 18,
                    lists: count.currencyL,
                    location: "New Zealand dollar"),
                FilteredSelectionRows(
                    index: 19,
                    lists: count.currencyL,
                    location: "United State dollar")
              ]),
            SizedBox(
              height: 10,
            ),
            if (region || subRegion || capital || currency)
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () {
                    count.clear();
                    count.filtered();
                    Navigator.of(context).pop();
                  },
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
                  onTap: () {
                    count.filtered();
                    Navigator.of(context).pop();
                    print("re: ${count.regionL}");
                    print("sub: ${count.subRegionL}");
                    print(count.capitalL);
                    print(count.currencyL);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    borderOnForeground: false,
                    color: Colors.deepOrange,
                    child: const SizedBox(
                      height: 50,
                      width: 250,
                      child: Center(
                        child: Text(
                          "Show results",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 5,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(300)),
                  child: Center(
                    child: Divider(
                      thickness: 7,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
