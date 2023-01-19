import 'package:countries_app/Model/country_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Country country;
  const DetailPage({required this.country, Key? key}) : super(key: key);
  static const routeDetailPage = "/detail";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> pics = [];

  int _currentIndex = 0;
  @override
  void initState() {
      pics.add( widget.country.flags?.png ?? widget.country.flags!.svg.toString(),);
      var check = widget.country.coatOfArms?.png ?? widget.country.coatOfArms!.svg.toString();
      print(check);
      if (!check.contains('null')){
      pics.add(check);}


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: height - 25,
            child: SingleChildScrollView(
              physics:
                  const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              dragStartBehavior: DragStartBehavior.start,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(widget.country.name!.common.toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SizedBox(
                        height: 200,
                        width: width,
                        child: Stack(
                          // fit: StackFit.expand,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                    height: 220,
                                    width: _currentIndex == 1
                                        ? width * 0.4
                                        : width,
                                    child: Image.network(
                                      pics[_currentIndex],
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 75,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 20,
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    onPressed: () {
                                      if (_currentIndex > 0) {
                                        setState(() {
                                          _currentIndex--;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 75,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 20,
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      if (_currentIndex < (pics.length - 1)) {
                                        setState(() {
                                          _currentIndex++;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: (width - 80) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: pics.map((e) => Text(
                                  ".",
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: _currentIndex == pics.indexOf(e)
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                                ).toList()
                              ),
                            )
                          ],
                        )),
                  ),
                  details(context, "Population",
                      widget.country.population.toString()),
                  details(context, "Region", widget.country.region.toString()),
                  details(context, "Capital", widget.country.capital?[0] ?? 'null'),
                  details(context, "Sub-region",
                      widget.country.subregion.toString()),
                  const SizedBox(
                    height: 25,
                  ),
                  details(context, "Official language", widget.country.languages?.eng??''),
                  details(context, "Ethic group", widget.country.demonyms?.eng?.official??''),
                  const SizedBox(
                    height: 20,
                  ),
                  details(context, "Independence",
                      widget.country.independent.toString()),
                  details(context, "Area", widget.country.area.toString()),
                  details(
                      context, "Currency", widget.country.currencies.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  details(context, "Time zone", widget.country.timezones?[0]?? ''),
                  details(context, "Date format", "dd/mm/yyyy"),
                  details(context, "Dialing code", '${widget.country.idd?.root??''}${widget.country.idd?.suffixes?[0]??''}'),
                  details(context, "Driving side", widget.country.car?.side ?? ''),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 5,
              width: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(300)),
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
    );
  }
}

Widget details(BuildContext context, String title, String details) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
    child: Row(
      children: [
        Text(
          "$title:  ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(details, style: Theme.of(context).textTheme.bodySmall),
      ],
    ),
  );
}
