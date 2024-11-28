
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage("https://img.idxchannel.com/media/700/images/idx/2024/06/08/cara_beli_saham_GoTo_1.jpg"),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black54, BlendMode.colorBurn))
      ),
      child: const Stack(
        children: [
          Positioned(
            bottom: 39,
            left: 10,
            child: Text("CNBC Indonesia",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 17),)),
            Positioned(
            bottom: 15,
            left: 10,
            child: Text("Saham goto turun drastis",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 20),))
      ],),
    );
  }
}