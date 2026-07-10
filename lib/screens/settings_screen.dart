import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart' as app;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _currentLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('languageCode') ?? 'en';
    });
  }

  _changeLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', code);
    setState(() {
      _currentLanguage = code;
    });
    // Перезапускаем приложение, чтобы применить язык
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => app.MyApp(languageCode: code)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(l10n.language),
              trailing: DropdownButton<String>(
                value: _currentLanguage,
                items: const [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'ru', child: Text('Русский')),
                ],
                onChanged: (value) {
                  if (value != null) _changeLanguage(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
