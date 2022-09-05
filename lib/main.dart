import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/alltransaction/alltrans_provider.dart';
import 'package:money_manager/controller/provider/bottom_navigation_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/controller/provider/pageview/pageview_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/controller/provider/updatetransaction/update_transaction.dart';
import 'package:money_manager/model/transaction_model/transaction_model.dart';
import 'package:money_manager/utilities/theme.dart';
import 'package:money_manager/view/spalsh/screen_splash.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageNotifier()),
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
        ChangeNotifierProvider(create: (_) => AddTransactionProvider()),
        ChangeNotifierProvider(create: (_) => DataBaseProvider()),
        ChangeNotifierProvider(create: (_) => AllTransProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UpdateTransactionProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              MonthYearPickerLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Money Manager',
            themeMode: value.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            home: const ScreenSplash(),
          );
        },
      ),
    );
  }
}
