import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:flutter_burc_rehberi/utils/strings.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar =
      veriKaynaginiHazirla(); // Burc, burc.dart dosyasındaki burc class'ı.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanEklenenBurc = tumBurclar[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => BurcDetay(index))),

          leading: Image.asset(
            "images/" + oanEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          // -> images/koc1.png mesela
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.pink,
            size: 30,
          ),
          title: Text(
            oanEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              oanEklenenBurc.burcTarihi,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400, // yazı kalınlığı
                  color: Colors.black38),
            ),
          ),
        ),
      ),
    );
  }
}

List<Burc> veriKaynaginiHazirla() {
  List<Burc> burclar = [];

  for (int i = 0; i < 12; i++) {
    String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
    /* yukarıda yapılan şu, kucukResim'e burc adlarını yazdı. Daha sonra kücük harfe cevirdi. Sonra yanına
    1'den başlayarak sayı ekleyip.png ekledi.
     Çünkü burç adlarına baktığımızda isimler büyük harfle başlıyor (Koç, Boğa..). ama resimler
     koc1.png, boga2.png gibi. Tek tek böyle resim isimlerini yazmak yerine for döngüsü kullanarak isimleri
     çevirmiş olduk.' Kısaca Koc -> koc1.png oldu.*/
    String buyukResim =
        Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
    //debugPrint("$buyukResim");

    Burc eklenecekBurc = Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i], buyukResim, kucukResim);
    burclar.add(eklenecekBurc);
  }
  return burclar;
}
