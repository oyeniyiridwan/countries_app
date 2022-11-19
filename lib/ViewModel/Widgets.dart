import 'package:countries_app/Model/country.dart';
import 'package:countries_app/View/Screens/Details.dart';
import 'package:flutter/material.dart';

Widget card(BuildContext context, String title, Widget icon, Widget build) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
          context: context,
          builder: (context) => build,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor);
    },
    child: Card(
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
    ),
  );
}

Widget listCountry(BuildContext context, Country country) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(country: country)));
      },
      child: Container(
        color: Colors.transparent,
        height: 50,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  country.imageUrl[0]!,
                  fit: BoxFit.fill,
                  height: 45,
                  width: 45,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
                  child: Text(
                    country.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    country.capital,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).disabledColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildListCountry(BuildContext context, List<Country> lists) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    // physics: const AlwaysScrollableScrollPhysics(),
    itemCount: lists.length,
    itemBuilder: (context, i) {
      if (i == 0) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                lists[i].name[0],
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ),
            listCountry(context, lists[i])
          ],
        );
      }
      if (lists[i].name[0] != lists[i - 1].name[0]) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                lists[i].name[0],
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ),
            listCountry(context, lists[i])
          ],
        );
      }
      return listCountry(context, lists[i]);
    },
  );
}
