import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_bloc/model/umkm_state.dart';
import 'package:umkm_bloc/page/home_page.dart';
import 'package:umkm_bloc/provider/daftar_umkm_provider.dart';
import 'package:umkm_bloc/provider/umkm_provider.dart';

//model berisi data/state

//cubit untuk acvtivity model

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => umkmProvider(
                  umkm: umkmModel(
                      id: "",
                      name: "",
                      type: "",
                      memberSejak: "",
                      omzetBulan: "",
                      lamaUsaha: ""))),
          ChangeNotifierProvider(
              create: (context) => umkmListProvider(listUmkm: [])),
        ],
        child: const HomePage(),
      ),
    );
  }
}
