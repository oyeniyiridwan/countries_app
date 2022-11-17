import 'package:countries_app/View/Filter.dart';
import 'package:countries_app/View/Languages.dart';
import 'package:countries_app/ViewModel/Widgets.dart';
import 'package:countries_app/Services/countries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeHomePage = "/";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isInit = true;
  bool isLoading = false;
  @override
  @override
  void initState() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Countries>(context, listen: false)
          .fetchCountries()
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    setState(() {
      isInit = false;
    });
    super.initState();
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final count = Provider.of<Countries>(context, listen: true);
    final countData = count.items;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Explore",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 7),
                          child: Text(
                            ".",
                            style: TextStyle(color: Colors.red, fontSize: 35),
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: count.isDarkMode
                        ? ImageIcon(
                            const AssetImage(
                              "images/sun.png",
                            ),
                            color: Theme.of(context).iconTheme.color,
                            size: 30,
                          )
                        : Icon(
                            Icons.dark_mode_outlined,
                            color: Theme.of(context).iconTheme.color,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        count.isDarkMode
                            ? count.setLightMode()
                            : count.setDarkMode();
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).canvasColor),
                  child: TextField(
                    onChanged: (value) {
                      count.onChange(value);
                    },
                    // autofocus: false,
                    // controller: _textEditingController,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 30),
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      hintText: "Search Country",
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  card(
                    context,
                    "EN",
                    const Icon(Icons.language),
                    const Languages(),
                  ),
                  card(
                      context,
                      "Filter",
                      const ImageIcon(AssetImage("images/filter.png")),
                      const Filter())
                ],
              ),
            ),
            SizedBox(
                height: height - 230,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : buildListCountry(context, countData)),
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
      ),
    );
  }
}
