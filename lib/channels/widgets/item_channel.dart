import 'package:flutter/material.dart';

class ItemChannel extends StatefulWidget {
  const ItemChannel({Key? key}) : super(key: key);

  @override
  State<ItemChannel> createState() => _ItemChannelState();
}

class _ItemChannelState extends State<ItemChannel> {
  void channelPressed() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: channelPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
