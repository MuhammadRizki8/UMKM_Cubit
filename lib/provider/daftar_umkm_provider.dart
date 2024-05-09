import 'package:flutter/material.dart';
import 'package:umkm_bloc/model/umkm_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class umkmListProvider extends ChangeNotifier {
  String url = "http://127.0.0.1:8000/daftar_umkm";
  List<umkmModel> listUmkm = [];
  umkmListProvider({required this.listUmkm});
  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    listUmkm = data
        .map((e) => umkmModel(
            id: e['id'],
            name: e['name'],
            type: e['type'],
            memberSejak: e['member_sejak'],
            omzetBulan: e['omzet_bulan'],
            lamaUsaha: e['lama_usaha']))
        .toList();
    notifyListeners();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
