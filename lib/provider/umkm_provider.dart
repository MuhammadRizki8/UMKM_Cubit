import 'package:flutter/material.dart';
import 'package:umkm_bloc/model/umkm_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class umkmProvider extends ChangeNotifier {
  String url = "http://127.0.0.1:8000/detil_umkm/";
  umkmModel umkm = umkmModel(
      id: "",
      name: "",
      type: "",
      memberSejak: "",
      omzetBulan: "",
      lamaUsaha: "");
  umkmProvider({required this.umkm});

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    umkm.id = json['id'];
    umkm.name = json['name'];
    umkm.type = json['type'];
    umkm.memberSejak = json['member_sejak'];
    umkm.omzetBulan = json['omzet_bulan'];
    umkm.lamaUsaha = json['lama_usaha'];
    notifyListeners();
  }

  void fetchData(String id) async {
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
