import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var imageURLs = [
    "https://i.pinimg.com/564x/22/3f/2b/223f2b209f44f467d5c743fea5f2df6e.jpg",
    "https://i.pinimg.com/564x/32/a9/c3/32a9c3e4bbe888aac60348570759e93b.jpg",
    "https://i.pinimg.com/564x/fd/d8/9a/fdd89af180217bc9a65445e2567074c6.jpg",
    "https://i.pinimg.com/564x/15/ca/20/15ca20fc8cf3c5b4b92c4b5a63e78b56.jpg",
    "https://i.pinimg.com/564x/4b/e7/04/4be704ff65aa81dff6cba36bdcf785fd.jpg",
    "https://i.pinimg.com/564x/dc/ba/d7/dcbad79307d706f873ac6f94008800ba.jpg",
    "https://i.pinimg.com/564x/21/02/3e/21023e2da11a91a6191002c87f5356e3.jpg",
    "https://i.pinimg.com/564x/be/83/79/be8379fea2f45996e43177afe9dae440.jpg"
  ];

  var selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cacheImage = new CachedNetworkImage(
      placeholder: (context, url) => new CircularProgressIndicator(),
      imageUrl: imageURLs[selectedImageIndex],
      height: 350,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Load URL image"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                  child: cacheImage,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  child: Text("Back"),
                  onPressed: () {
                    setState(() {
                      selectedImageIndex = selectedImageIndex <= 0
                          ? selectedImageIndex
                          : selectedImageIndex - 1;
                    });
                  },
                )),
                Expanded(
                    child: RaisedButton(
                  child: Text("Next"),
                  onPressed: () {
                    setState(() {
                      selectedImageIndex =
                          (selectedImageIndex >= imageURLs.length - 1)
                              ? selectedImageIndex
                              : selectedImageIndex + 1;
                    });
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
