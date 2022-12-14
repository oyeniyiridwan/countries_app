import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const LanguageRows(a: false, language: "Bahasa"),
          const LanguageRows(a: false, language: "Deutch"),
          const LanguageRows(a: false, language: "English"),
          const LanguageRows(a: false, language: "Español"),
          const LanguageRows(a: false, language: "Français"),
          const LanguageRows(a: false, language: "Italiano"),
          const LanguageRows(a: false, language: "Português"),
          const LanguageRows(a: false, language: "русский"),
          const LanguageRows(a: false, language: "Svenka"),
          const LanguageRows(a: false, language: "Türkçe"),
          const LanguageRows(a: false, language: ""),
          const LanguageRows(a: false, language: "العربية"),
        ],
      ),
    );
  }
}

class LanguageRows extends StatefulWidget {
  final String language;
  final bool a;
  const LanguageRows({required this.a, required this.language, Key? key})
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
            Icon(widget.a ? Icons.circle_sharp : Icons.circle_outlined),
          ],
        ),
      ),
    );
  }
}
