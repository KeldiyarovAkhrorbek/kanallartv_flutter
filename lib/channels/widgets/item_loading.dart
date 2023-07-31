import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemLoading extends StatefulWidget {
  const ItemLoading({Key? key}) : super(key: key);

  @override
  State<ItemLoading> createState() => _ItemLoadingState();
}

class _ItemLoadingState extends State<ItemLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Text("index: 0"),
      ),
    );
  }
}
