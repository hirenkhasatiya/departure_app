import 'package:departure_app/controller/sloka_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4E000E),
        foregroundColor: Colors.white,
        title: Text("${data['name']}"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<slokacontroller>(context, listen: false)
                    .languageChange();
              },
              icon: Icon(Icons.translate))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<slokacontroller>(builder: (context, Provider, child) {
          return Container(
            padding: EdgeInsets.fromLTRB(100, 10, 20, 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/page.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                    "${data["id"]}\t\t"
                    "${data["name"]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Align(
                  alignment: Alignment.centerRight,
                  child: SelectableText(
                    "${data["name_translation"]}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                    "${Provider.translate ? data["chapter_summary_hindi"] : data["chapter_summary"]}",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
