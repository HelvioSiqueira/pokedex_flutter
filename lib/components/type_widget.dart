import 'package:flutter/material.dart';
import 'package:pokedex_flutter/utils/capitilize.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration;

    boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: const Color.fromRGBO(165, 164, 165, 1), width: 2));

    switch (type) {
      case "ground":
        boxDecoration = boxDecoration.copyWith(
            gradient: const SweepGradient(colors: [
          Color.fromRGBO(171, 152, 66, 1),
          Color.fromRGBO(247, 222, 63, 1),
        ], stops: [
          0.5,
          0.5
        ], tileMode: TileMode.repeated));
      case "dragon":
        boxDecoration = boxDecoration.copyWith(
            gradient: const SweepGradient(colors: [
          Color.fromRGBO(240, 109, 87, 1),
          Color.fromRGBO(83, 164, 207, 1)
        ], stops: [
          0.5,
          0.5
        ], tileMode: TileMode.repeated));
      case "flying":
        boxDecoration = boxDecoration.copyWith(
            gradient: const SweepGradient(colors: [
              Color.fromRGBO(240, 23, 87, 1),
              Color.fromRGBO(65, 164, 12, 1)
            ], stops: [
              0.5,
              0.5
            ], tileMode: TileMode.repeated));
      case "normal":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(165, 173, 175, 1));
      case "bug":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(114, 159, 62, 1));
      case "poison":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(186, 126, 201, 1));
      case "rock":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(162, 139, 35, 1));
      case "ghost":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(123, 98, 162, 1));
      case "steel":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(158, 183, 183, 1));
      case "fire":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(253, 125, 36, 1));
      case "water":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(69, 146, 195, 1));
      case "electric":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(238, 213, 54, 1));
      case "dark":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(112, 112, 112, 1));
      case "fairy":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(114, 159, 62, 1));
      case "shadow":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(252, 184, 233, 1));
      case "psychic":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(244, 102, 184, 1));
      case "grass":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(154, 204, 80, 1));
      case "ice":
        boxDecoration = boxDecoration.copyWith(
            color: const Color.fromRGBO(82, 195, 231, 1));
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        width: 90,
        padding: const EdgeInsets.all(4),
        decoration: boxDecoration,
        child: Text(type.capitalize()),
      ),
    );
  }
}
