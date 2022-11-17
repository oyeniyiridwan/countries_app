import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Languages"),
                  IconButton(
                    icon: const Icon(Icons.dangerous_sharp),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
            LanguageRows(a: false, language: "Bahasa"),
            LanguageRows(a: false, language: "Deutch"),
            LanguageRows(a: false, language: "English"),
            LanguageRows(a: false, language: "Español"),
            LanguageRows(a: false, language: "Français"),
            LanguageRows(a: false, language: "Italiano"),
            LanguageRows(a: false, language: "Português"),
            LanguageRows(a: false, language: "русский"),
            LanguageRows(a: false, language: "Svenka"),
            LanguageRows(a: false, language: "Türkçe"),
            LanguageRows(a: false, language: ""),
            LanguageRows(a: false, language: "العربية"),
          ],
        ),
      ),
    );
  }
}

class LanguageRows extends StatefulWidget {
  String language;
  bool a;
  LanguageRows({required this.a, required this.language, Key? key})
      : super(key: key);

  @override
  State<LanguageRows> createState() => _LanguageRowsState();
}

class _LanguageRowsState extends State<LanguageRows> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.language,
              style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontWeight: FontWeight.normal),
            ),
            IconButton(
                icon:
                    Icon(widget.a ? Icons.circle_sharp : Icons.circle_outlined),
                onPressed: () {
                  setState(() {
                    widget.a = !widget.a;
                  });
                })
          ],
        ),
      ),
    );
  }
}
