import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:como_gasto/como_gasto_icons.dart';
import 'package:como_gasto/como_gasto_localizations.dart';
import 'package:como_gasto/others/month_widget.dart';
import 'package:como_gasto/pages/notifications/local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rect_getter/rect_getter.dart';
import '../expenses_repository.dart';
import '../utils.dart';
import 'ui/loading_widget.dart';
import 'ui/month_selector_slider.dart';
import 'ui/no_data_widget.dart';
import 'ui/stream_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = DateTime.now().month - 1; 
  GraphType currentType = GraphType.LINES; 
  final GlobalKey globalKey = GlobalKey();
  Rect? buttonRect;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesRepository>(
      builder: (BuildContext context, ExpensesRepository db, Widget? child) {

        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            notchMargin: 8.0,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _bottomAction(ComoGastoIcons.stats_bars, () {
                  setState(() {
                    currentType = GraphType.LINES;
                  });
                }),
                _bottomAction(ComoGastoIcons.pie_chart, () {
                  setState(() {
                    currentType = GraphType.PIE;
                  });
                }),
                SizedBox(width: 48.0), // Espacio para el FAB
                _bottomAction(ComoGastoIcons.cart, () {}),
                _bottomAction(ComoGastoIcons.settings, () {
                  Navigator.pushNamed(context, '/settings');
                }),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: RectGetter(
            key: GlobalKey(),
            child: FloatingActionButton(
              child: Icon(ComoGastoIcons.plus),
              onPressed: () {
                buttonRect = RectGetter.getRectFromKey(GlobalKey());

                Navigator.of(context).pushNamed('/add', arguments: buttonRect);
              },
            ),
          ),
          body: _body(),
        );
      },
    );
  }

  Widget _bottomAction(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  Widget _body() {
    
    return Center(
      child: Text("Aquí va el contenido del cuerpo"),
    );
  }
}