import "dart:convert";

import "package:flutter/material.dart";
import "package:temp/function.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imgUrl =
      "https://firebasestorage.googleapis.com/v0/b/howie-4fadb.appspot.com/o/test2.jpg?alt=media&token=4e377e53-1b08-4276-8f69-99084ab8bd80";

  String breed = "";
  String perecentage = "";

  void getPrediction() async {
    String apiCallUrl = "http://10.0.2.2:5000/predict?img_url=$imgUrl";

    var data = await fetchdata(apiCallUrl);
    // var decodedData = jsonDecode(data);
    var decodedData;

    if (data is String) {
      decodedData = jsonDecode(data);

      setState(() {
        breed = decodedData["breed"].toString();
        perecentage = decodedData["score"].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Column(
          children: [
            const Center(
              child: Text("Hello World"),
            ),
            const SizedBox(height: 20),
            Image(image: NetworkImage(imgUrl)),
            const SizedBox(height: 20),
            TextButton(
              onPressed: getPrediction,
              child: Container(
                  color: Colors.green,
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Predict",
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            breed != "" ? Text("Breed: $breed") : Container(),
            perecentage != "" ? Text("Perecentage: $perecentage") : Container(),
          ],
        ));
  }
}
