import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kanallartv_flutter/channels/widgets/item_channel.dart';
import 'package:kanallartv_flutter/channels/widgets/item_loading.dart';
import '../models/channel_model.dart';
import 'package:http/http.dart' as http;

class ChannelsScreen extends StatefulWidget {
  @override
  State<ChannelsScreen> createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends State<ChannelsScreen> {
  Future<List<Channel>> fetchChannels() async {
    List<Channel> channelList = [];
    final response = await http.get(Uri.parse(
        'https://kanallartv-f22d4-default-rtdb.firebaseio.com/channels.json'));

    if (response.statusCode == 200) {
      final listData = json.decode(response.body) as List;
      channelList = [];
      listData.forEach((element) {
        if (element != null)
          channelList.add(
            Channel.fromJson(element),
          );
      });
      print(channelList.length);
      return channelList;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchChannels(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Channel>> channelSnapshot) {
            if (channelSnapshot.connectionState == ConnectionState.waiting) {
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ItemLoading();
                },
              );
            }
            if (channelSnapshot.connectionState == ConnectionState.done)
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ItemChannel();
                },
              );
            return Center(
              child: Text(
                'Error loading data',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
