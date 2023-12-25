import 'package:codelab1/model/tourism_place.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
// Anda dapat menggunakan variabel untuk menyimpan TextStyle dan meringkas kode.

class DetailScreen extends StatelessWidget{

  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: SingleChildScrollView(
          /*
          Widget ini membutuhkan satu child yang nantinya bisa di-scroll pada layar.
          Pindahkan widget Column ke dalam SingleChildScrollView supaya nantinya bisa di-scroll.
           */

       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[

           Stack(
             children: <Widget>[
               Image.asset(place.imageAsset),
               SafeArea(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CircleAvatar(
                         backgroundColor: Colors.grey,
                         child: IconButton(
                           icon: const Icon(Icons.arrow_back, color: Colors.white),
                           onPressed: (){
                             Navigator.pop(context);
                           },
                         ),
                       ),
                       const FavoriteButton(),
                     ],
                   ),
                 ),
               )
             ],
           ),

           Container(
             margin: const EdgeInsets.only(top: 16.0),
             child: Text(
               place.name,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     fontSize: 30.0,
                     fontFamily: 'Staatliches',
                     //  parameter fontFamily pada widget TextStyle untuk menerapkan style pada Text

                     fontWeight: FontWeight.bold
                 ),
             ),
           ),
           Container(
             margin: const EdgeInsets.symmetric(vertical: 16.0),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Column(
                       children: <Widget>[
                        const Icon(Icons.calendar_today),
                        const SizedBox(height: 8.0),
                         Text(
                           place.openDays,
                           style: informationTextStyle,
                         ),
                       ],
                   ),
                   Column(
                     children: <Widget>[
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(height: 8.0),
                       Text(
                         place.openTime,
                         style: informationTextStyle,
                       ),
                     ],
                   ),
                   Column(
                       children: <Widget>[
                        const Icon(Icons.monetization_on),
                        const SizedBox(height: 8.0),
                         Text(
                             place.ticketPrice,
                           style: informationTextStyle,
                         ),
                       ],
                   ),
                 ],
             ),
           ),
           Container(
               padding: const EdgeInsets.all(16.0),
               child: Text(
                 place.description,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     fontSize: 16.0,
                   fontFamily: 'Oxygen'
                 ),
               ),
           ),

           SizedBox(
             height: 150,
             child: ListView(
               scrollDirection: Axis.horizontal,
                 // untuk mengubahnya menjadi horizontal kita cukup menambahkan parameter scrollDirection bernilai Axis.horizontal.

                 children: place.imageUrls.map((url){
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            // mengambil gambar melalui url
                          child: Image.network(url),
                        ),
                    );

                   // tambahkan Padding pada masing-masing Image supaya antar gambar tidak terlalu rapat.
                }).toList(),
           ),
         //   ListView diletakkan di dalam Column, di mana keduanya sama-sama memiliki atribut height yang memakan space di sepanjang layar. Sebagai solusi kita perlu memberikan ukuran tinggi yang statis terhadap ListView. Namun ListView tidak memiliki parameter height, lantas bagaimana nih? Caranya, gunakan widget lain yang memiliki parameter height. Anda dapat membungkus widget ListView ke dalam Container atau pun SizedBox. Ukuran tinggi ini nantinya juga digunakan sebagai tinggi Image yang tampil.
           ),
           ],
       ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  const FavoriteButton({Key? key}): super(key: key);


  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();

}
class _FavoriteButtonState extends State<FavoriteButton>{
  bool isFavorite = false;

  @override
  Widget build(BuildContext context){
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: (){
        setState((){
          isFavorite = !isFavorite;
        });
      },
    );
  }
}