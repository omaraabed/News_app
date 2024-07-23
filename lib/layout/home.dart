import 'package:flutter/material.dart';
import 'package:news/models/sourcsResponse.dart';
import 'package:news/shared/network/api_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routeNAme = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Column(
        children: [
          FutureBuilder<SourcesResponse>(
            future: ApiManager.getSources(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [Text("Something Wrong!!!!!!!!")],
                  ),
                );
              }
              if (snapshot.data?.status != "ok") {
                return Center(
                  child: Column(
                    children: [Text("Erorrrrr!!!!!!!!")],
                  ),
                );
              }
              var source = snapshot.data?.sources ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(source[index].name ?? "");
                  },
                  itemCount: source.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
