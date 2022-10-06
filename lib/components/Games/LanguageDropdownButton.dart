import 'package:flutter/material.dart';

class LanguageDropdownButton extends StatefulWidget {
  LanguageDropdownButton(
      {this.hintText,
      this.onChange,
      this.selectedLanguage,
      this.excludedLanguage,
      this.isDisabled,
      this.availableLanguages});

  final String hintText, selectedLanguage, excludedLanguage;
  final List<String> availableLanguages;
  final bool isDisabled;
  final Function onChange;

  @override
  State<LanguageDropdownButton> createState() => _LanguageDropdownButtonState();
}

class _LanguageDropdownButtonState extends State<LanguageDropdownButton> {
  List languages = [
    {
      "title": "Latin",
      "flagPath": "assets/images/latin_flag_circular.png",
      "langCode": "la"
    },
    {
      "title": "Latviešu",
      "flagPath": "assets/images/latvian_flag_circular.png",
      "langCode": "lv"
    },
    {
      "title": "English",
      "flagPath": "assets/images/uk_flag_circular.png",
      "langCode": "en"
    },
    {
      "title": "Pусский",
      "flagPath": "assets/images/russian_flag_circular.png",
      "langCode": "ru"
    },
    {
      "title": "Deutsche",
      "flagPath": "assets/images/german_flag_circular.png",
      "langCode": "de"
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var languagesDisplayed = [];
    if (widget.availableLanguages != null) {
      widget.availableLanguages.forEach((lang) {
        var foundLanguage = languages.firstWhere(
            (language) => language["langCode"] == lang,
            orElse: () => null);
        if (foundLanguage != null) {
          languagesDisplayed.add(foundLanguage);
        }
      });
    } else {
      languagesDisplayed = [...languages];
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: DropdownButton(
        isExpanded: true,
        isDense: true,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        hint:
            Text(widget.hintText != null ? widget.hintText : 'Izvēlies valodu'),
        value: widget.selectedLanguage,
        onChanged: widget.isDisabled != null && widget.isDisabled
            ? null
            : (newValue) {
                widget.onChange(newValue);
              },
        items: languagesDisplayed
            .where((lang) => lang["langCode"] != widget.excludedLanguage)
            .map((language) {
          return DropdownMenuItem(
            child: Row(
              children: [
                Image.asset(
                  language["flagPath"],
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    language["title"],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            value: language["langCode"],
          );
        }).toList(),
      ),
    );
  }
}
