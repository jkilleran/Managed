import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';

import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../../common_widget/upcoming_bill_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Variable para controlar si se muestran las suscripciones o las facturas próximas.
  bool isSubscription = true;

  // Lista de suscripciones con detalles como nombre, ícono y precio.
  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
    {"name": "NetFlix", "icon": "assets/img/netflix_logo.png", "price": "15.00"}
  ];

  // Lista de facturas próximas con detalles como nombre, fecha y precio.
  List bilArr = [
    {"name": "Spotify", "date": DateTime(2023, 07, 25), "price": "5.99"},
    {
      "name": "YouTube Premium",
      "date": DateTime(2023, 07, 25),
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2023, 07, 25),
      "price": "29.99"
    },
    {"name": "NetFlix", "date": DateTime(2023, 07, 25), "price": "15.00"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context); // Obtiene las dimensiones de la pantalla.
    return Scaffold(
      backgroundColor: Colors.black87, // Fondo de la pantalla.
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1, // Ajusta la altura en función del ancho de la pantalla.
              decoration: BoxDecoration(
                color: Colors.blueGrey[800], // Fondo semitransparente oscuro.
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center, // Alinea todos los widgets en el centro.
                children: [
                  Image.asset("assets/img/home_bg.png"), // Imagen de fondo.
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 0.72,
                        height: media.width * 0.72,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220), // Dibuja un arco personalizado.
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingsView(),
                                  ),
                                );
                              },
                              icon: Image.asset(
                                "assets/img/settings.png",
                                width: 25,
                                height: 25,
                                color: Colors.white, // Ícono de configuración en blanco.
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: media.width * 0.05),
                      /*Image.asset(
                        "assets/img/app_logo.png",
                        width: media.width * 0.25,
                        fit: BoxFit.contain, // Logotipo de la aplicación.
                      ),*/
                      SizedBox(height: media.width * 0.07),
                      Text(
                        "\$1,235",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700, // Muestra el total de facturas.
                        ),
                      ),
                      SizedBox(height: media.width * 0.055),
                      Text(
                        "Gastos de este mes",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: media.width * 0.07),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                            ),
                            color: Colors.blueGrey[700], // Fondo del botón más oscuro.
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "Ver tu presupuesto",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Suscripciones activas",
                                value: "12",
                                statusColor: Colors.tealAccent, // Botón con el número de suscripciones activas.
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: StatusButton(
                                title: "Suscripción más cara",
                                value: "\$19.99",
                                statusColor: Colors.deepOrangeAccent, // Botón con la suscripción más cara.
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: StatusButton(
                                title: "Suscripción más barata",
                                value: "\$5.99",
                                statusColor: Colors.amberAccent, // Botón con la suscripción más barata.
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[900], // Fondo de los botones de selección.
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: "Tu suscripción",
                      isActive: isSubscription,
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription; // Alterna entre suscripciones y facturas.
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SegmentButton(
                      title: "Facturas próximas",
                      isActive: !isSubscription,
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
                itemBuilder: (context, index) {
                  var sObj = subArr[index] as Map? ?? {};
                  return SubScriptionHomeRow(
                    sObj: sObj,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubscriptionInfoView(sObj: sObj),
                        ),
                      );
                    },
                  );
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bilArr.length,
                itemBuilder: (context, index) {
                  var bObj = bilArr[index] as Map? ?? {};
                  return UpcomingBillRow(
                    sObj: bObj,
                    onPressed: () {},
                  );
                },
              ),
            const SizedBox(height: 110), // Espaciado al final de la vista.
          ],
        ),
      ),
    );
  }
}
