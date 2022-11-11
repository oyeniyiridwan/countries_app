import 'package:countries_app/countries.dart';
import 'package:countries_app/useable.dart';
import 'package:flutter/gestures.dart';
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          dragStartBehavior: DragStartBehavior.start,
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
                      Icons.dark_mode_outlined,
                      color: Theme.of(context).iconTheme.color,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      search = !search;
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).canvasColor),
                    child: search
                        ? TextFormField(
                            cursorColor: Theme.of(context).iconTheme.color,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                            ),
                            autofocus: true,
                            onFieldSubmitted: (_) {
                              setState(() {
                                search = !search;
                              });
                            },
                          )
                        : searchL(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card(context, "EN", Icon(Icons.language)),
                    card(context, "Filter", Icon(Icons.filter_list_alt))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
