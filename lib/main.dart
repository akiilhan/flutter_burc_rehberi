import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';

void main() => runApp(Myapp());

/*void main(){
  runApp(Myapp()); // runApp flutterın başlaması için gerekli. Ayrıca main metodunda tek satırlık bi ifade var. Dolayısıyla fat error kullanabiliriz.Dolayısıyla yukarıdaki gibi de yapılabilir.
}*/

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Burç Rehberi",
      theme: ThemeData(primarySwatch: Colors.pink),
      home:
          BurcListesi(), // Burası uygulama başlatıldığında açılacak olan ilk sayfa olacak.
    );
  }
}
