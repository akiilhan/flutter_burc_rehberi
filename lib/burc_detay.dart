import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';

class BurcDetay extends StatelessWidget {
  int gelenIndex;
  Burc secilenBurc;

  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[gelenIndex];
    debugPrint("$gelenIndex");

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            
            backgroundColor: Colors.pink,
            title: Text(
              secilenBurc.burcAdi + " Burcu ve Özellikleri",
              style: TextStyle(fontSize: 22),
            ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("images/" +secilenBurc.burcBuyukResim, fit:BoxFit.cover,),
                centerTitle: true,

              ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(secilenBurc.burcDetay, style: TextStyle(fontSize: 18,color: Colors.black87), ),


            ),


          ),
        ],
      ),
    );
  }
}
