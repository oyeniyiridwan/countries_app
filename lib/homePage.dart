import 'package:countries_app/Country.dart';
import 'package:countries_app/Filter.dart';
import 'package:countries_app/Languages.dart';
import 'package:countries_app/countries.dart';
import 'package:countries_app/useable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeHomePage = "/";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool search = false;
  @override
  void initState() {
    super.initState();
    Provider.of<Countries>(context, listen: false).fetchCountries();
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final count = Provider.of<Countries>(context, listen: true);
    final countData = count.items;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListTile(
                leading: SizedBox(
                  width: width / 2,
                  child: Row(
                    children: [
                      Text(
                        "Explore",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          ".",
                          style: TextStyle(color: Colors.red, fontSize: 40),
                        ),
                      )
                    ],
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    count.isDarkMode ? Icons.sunny : Icons.dark_mode_outlined,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).canvasColor),
                  child: TextFormField(
                    onChanged: (value) {
                      count.onChange(value);
                    },
                    controller: _textEditingController,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                    // autofocus: true,
                    // onFieldSubmitted: (_) {
                    //   setState(() {
                    //     search = !search;
                    //   }
                    //   );
                    // },
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
              child: buildListCountry(context, countData),
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
                      color: Theme.of(context).disabledColor,
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
