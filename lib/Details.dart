import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static const routeDetailPage = "/detail";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> pics = [
    "images/goat.jpg",
    "images/delete.jfif",
    "images/bike7.png"
  ];
  int _currentIndex = 0;
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
              padding: const EdgeInsets.only(top: 20),
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
                      onPressed: () {},
                    ),
                    Text("Title",
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 50),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                  height: 200,
                  width: width,
                  child: Stack(
                    // fit: StackFit.expand,
                    children: [
                      SizedBox(
                        height: 200,
                        width: width,
                        child: Image(
                          image: AssetImage(pics[_currentIndex]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 75,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 25,
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
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
                          radius: 25,
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).iconTheme.color,
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
                      )
                    ],
                  )),
            ),
            details(context, "Population", "ade"),
            details(context, "Region", "ade"),
            details(context, "Capital", "ade"),
            details(context, "Motto", "ade"),
            const SizedBox(
              height: 25,
            ),
            details(context, "Official language", "ade"),
            details(context, "Ethic group", "ade"),
            details(context, "Religion", "ade"),
            details(context, "Government", "ade"),
            const SizedBox(
              height: 20,
            ),
            details(context, "Independence", "ade"),
            details(context, "Area", "ade"),
            details(context, "Currency", "ade"),
            details(context, "GDP", "ade"),
            const SizedBox(
              height: 20,
            ),
            details(context, "Time zone", "ade"),
            details(context, "Date format", "ade"),
            details(context, "Dialing code", "ade"),
            details(context, "Driving side", "ade"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
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
