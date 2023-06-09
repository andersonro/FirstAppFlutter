import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/pages/auto_size_text/auto_size_text_page.dart';
import 'package:trilhaapp/pages/battery_page.dart';
import 'package:trilhaapp/pages/configuracoes_hive_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais_hive_page.dart';
import 'package:trilhaapp/pages/geolocator.dart';
import 'package:trilhaapp/pages/heroes_page.dart';
import 'package:trilhaapp/pages/image_picker_page.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/navigationbar_custon/navigationbar_custom_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorios_pages.dart';
import 'package:trilhaapp/pages/porcent_indicator_page.dart';
import 'package:trilhaapp/pages/posts_page.dart';
import 'package:trilhaapp/pages/qr_code_page.dart';
import 'package:trilhaapp/pages/tarefa_back4App_page.dart';
import 'package:trilhaapp/shared/widgets/app_prefs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../pages/conexao_page.dart';

class DrawerCuston extends StatefulWidget {
  const DrawerCuston({Key? key}) : super(key: key);

  @override
  State<DrawerCuston> createState() => _DrawerCustonState();
}

class _DrawerCustonState extends State<DrawerCuston> {

  String nomeUsuario = "";
  String emailUsuario = "";

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuario = prefs.getString(AppPrefs.APP_PREFS_NOME) ?? "--";
      emailUsuario = prefs.getString(AppPrefs.APP_PREFS_EMAIL) ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: const [
                        ListTile(
                          title: Text("Camera"),
                          leading: Icon(Icons.camera_alt),
                        ),
                        ListTile(
                          title: Text("Galeria"),
                          leading: Icon(Icons.archive_outlined),
                        )
                      ],
                    );
                  }
              );
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: Text(nomeUsuario),
                accountEmail: Text(emailUsuario)
            ),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const DadosCadastraisHivePage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.info),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.home),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext bc) => const ConfiguracoesHivePage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.numbers),
                    Text("Números Aleatorios"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext bc) => const NumerosAleatoriosPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                        FontAwesomeIcons.pooStorm,
                        color: Colors.red,
                    ),
                    SizedBox(width: 5,),
                    Text("Posts"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const PostsPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.chartSimple,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5,),
                    Text("Indicadores de porcentagem"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const PorcentIndicatorPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.textWidth,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5,),
                    Text("Auto Size Text"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const AutoSizeTextPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.textWidth,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5,),
                    Text("Navigation Bar Custom"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const NavigationBarCustom()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Hérois"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const HerosPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Tarefas HTTP"),
                  ],
                )),
            onTap: () async {

              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const TarefaBack4AppPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.batteryHalf,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Status Battery"),
                  ],
                )),
            onTap: () async {

              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const BatteryPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.internetExplorer,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Abrir Google"),
                  ],
                )),
            onTap: () async {
              await launchUrl(Uri.parse("https://google.com.br"));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.mapLocation,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Abrir Maps"),
                  ],
                )),
            onTap: () async {
              await launchUrl(Uri.parse("google.navigation:q=Agudos SP&mode=d"));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.share,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Olhe esse site!"),
                  ],
                )),
            onTap: () {
              Share.share("https://google.com");
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.appStore,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Info App"),
                  ],
                )),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              print('APP NAME: ${appName}');
              String packageName = packageInfo.packageName;
              print('packageName: ${packageName}');
              String version = packageInfo.version;
              print('version: ${version}');
              String buildNumber = packageInfo.buildNumber;
              print('buildNumber: ${buildNumber}');

              print(Platform.isAndroid);
              print(Platform.operatingSystem);
              print(Platform.operatingSystemVersion);
              print(Platform.version);
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.dev,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Info Device"),
                  ],
                )),
            onTap: () async {

              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

              if (Platform.isAndroid) {
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
                print('Running on ${androidInfo.device}');
                print('Running on ${androidInfo.version}');
                print('Running on ${androidInfo.product}');
              } else if (Platform.isIOS) {
                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
              } else {
                WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
                print('Running on ${webBrowserInfo.userAgent}');
              }

            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.wifi,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Conexão"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const ConexaoPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.map,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("GPS"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const GeolocatorPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.qrcode,
                    ),
                    SizedBox(width: 5,),
                    Text("QRCode"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const QrCodePage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    //Icon(Icons.post_add),
                    FaIcon(
                      FontAwesomeIcons.camera,
                    ),
                    SizedBox(width: 5,),
                    Text("Camera"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const ImagePickerPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 15),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      elevation: 10,
                      title: const Text(
                        "Meu App",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      content: Wrap(
                        children: const [
                          const Text("Você realmente deseja sair do APP?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              SharedPreferences prefs = await SharedPreferences
                                  .getInstance();
                              await prefs.remove(AppPrefs.APP_PREFS_EMAIL);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage())
                              );
                            },
                            child: const Text("Sim")
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")
                        ),
                      ],
                    );
                  }
              );
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
