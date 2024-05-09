import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_bloc/model/umkm_state.dart';
import 'package:umkm_bloc/page/detail_page.dart';
import 'package:umkm_bloc/provider/daftar_umkm_provider.dart';
import 'package:umkm_bloc/provider/umkm_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                  'NIM 1, NAMA 1; NIM 2, NAMA 2; Saya berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang'),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Provider.of<umkmListProvider>(context, listen: false)
                      .fetchData();
                },
                child: const Text('Reload Daftar UMKM'),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Consumer<umkmListProvider>(
                  builder: (context, provider, child) {
                    if (provider.listUmkm.isEmpty) {
                      return const Center(
                          child:
                              Text("Belum ada data atau data gagal dimuat."));
                    }
                    return ListView.builder(
                      itemCount: provider.listUmkm.length,
                      itemBuilder: (context, index) {
                        umkmModel umkm = provider.listUmkm[index];
                        return ListTile(
                          title: Text(umkm.name),
                          subtitle: Text(umkm.type),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => DetailUmkmPage(umkmDetail: umkm),
                            ));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
