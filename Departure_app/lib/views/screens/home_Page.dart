import 'package:departure_app/controller/sloka_controller.dart';
import 'package:departure_app/helper/json_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("श्रीमद् भागवत गीता",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xff4E000E),
        foregroundColor: Colors.white,
        actions: [
          Consumer<slokacontroller>(builder: (context, Provider, child) {
            return IconButton(
                onPressed: () {
                  Provider.listchange();
                },
                icon: Icon(Provider.list ? Icons.list : Icons.grid_view));
          })
        ],
      ),
      body: Consumer<slokacontroller>(builder: (context, Provider, child) {
        return FutureBuilder(
          future: JsonHelper.jsonHelper.getSloka(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Provider.list
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Object data = snapshot.data![index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("Sloka_Page", arguments: data);
                            },
                            title: Text(
                              "${snapshot.data![index]["name"]}",
                            ),
                            subtitle: Text(
                              "${snapshot.data![index]["name_translation"]}",
                            ),
                            tileColor: Color(0xff4E000E).withOpacity(0.4),
                            leading: CircleAvatar(
                              backgroundColor: Color(0xff4E000E),
                              foregroundColor: Colors.white,
                              child: Text("${snapshot.data![index]["id"]}"),
                            ),
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Object data = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("Sloka_Page", arguments: data);
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/image/bhagavat.jpg"),
                                fit: BoxFit.cover,
                              )),
                              child: Center(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xff4E000E),
                                      child:
                                          Text("${snapshot.data![index]["id"]}",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "${snapshot.data![index]["name"]}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              )),
                        );
                      },
                    );
            } else if (snapshot.hasError) {
              return Text("${snapshot.hasError}");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      }),
    );
  }
}
