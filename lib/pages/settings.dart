import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gruharaksha/translation/bloc/translation_bloc.dart';
import 'package:gruharaksha/translation/global_translation.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'SettingsPage';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: Text(translations.text('pageNames.settings')),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    translations.text('pages.settings.general'),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    translations.text('pages.settings.language'),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 40,
                          ),
                          elevation: 16,
                          value: state.locale.languageCode,
                          items: translations.supportedLocales().map((l) {
                            return DropdownMenuItem(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    ' ${l.languageCode} ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.black,
                                    child: SizedBox(
                                      height: 1,
                                    ),
                                  )
                                ],
                              ),
                              value: l.languageCode,
                            );
                          }).toList(),
                          onChanged: (l) {
                            BlocProvider.of<TranslationBloc>(context).add(
                              SwitchLanguage(language: l),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ]));
    });
  }
}