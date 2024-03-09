import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipbook/pages/recipe_page.dart';
import 'package:recipbook/services/data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int selectedCat = 1;
String mealType = "";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kTextTabBarHeight,
        title: Text(
          "RecipBooK",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                  child: FilledButton.icon(
                      style: ButtonStyle(
                          backgroundColor: selectedCat == 1
                              ? MaterialStatePropertyAll(
                                  Colors.deepOrangeAccent)
                              : MaterialStatePropertyAll(
                                  Colors.deepPurple.shade900)),
                      focusNode: FocusNode(),
                      onPressed: () {
                        setState(() {
                          selectedCat = 1;
                          mealType = "";
                        });
                      },
                      icon: Icon(FontAwesomeIcons.list),
                      label: Text("All")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                  child: FilledButton.icon(
                      style: ButtonStyle(
                          backgroundColor: selectedCat == 2
                              ? MaterialStatePropertyAll(
                                  Colors.deepOrangeAccent)
                              : MaterialStatePropertyAll(
                                  Colors.deepPurple.shade900)),
                      onPressed: () {
                        setState(() {
                          selectedCat = 2;
                          mealType = "snacks";
                        });
                      },
                      icon: Icon(FontAwesomeIcons.cookie),
                      label: Text("Snacks")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                  child: FilledButton.icon(
                      style: ButtonStyle(
                          backgroundColor: selectedCat == 3
                              ? MaterialStatePropertyAll(
                                  Colors.deepOrangeAccent)
                              : MaterialStatePropertyAll(
                                  Colors.deepPurple.shade900)),
                      onPressed: () {
                        setState(() {
                          selectedCat = 3;
                          mealType = "breakfast";
                        });
                      },
                      icon: Icon(FontAwesomeIcons.burger),
                      label: Text("BreakFast")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                  child: FilledButton.icon(
                      style: ButtonStyle(
                          backgroundColor: selectedCat == 4
                              ? MaterialStatePropertyAll(
                                  Colors.deepOrangeAccent)
                              : MaterialStatePropertyAll(
                                  Colors.deepPurple.shade900)),
                      onPressed: () {
                        setState(() {
                          selectedCat = 4;
                          mealType = "lunch";
                        });
                      },
                      icon: Icon(FontAwesomeIcons.drumstickBite),
                      label: Text("Lunch")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                  child: FilledButton.icon(
                      style: ButtonStyle(
                          backgroundColor: selectedCat == 5
                              ? MaterialStatePropertyAll(
                                  Colors.deepOrangeAccent)
                              : MaterialStatePropertyAll(
                                  Colors.deepPurple.shade900)),
                      onPressed: () {
                        setState(() {
                          selectedCat = 5;
                          mealType = "dinner";
                        });
                      },
                      icon: Icon(FontAwesomeIcons.wineBottle),
                      label: Text("Dinner")),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: FutureBuilder(
                future: DataService().getrecipe(mealType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Unable to Load"),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RecipePage(
                                      recipe: snapshot.data![index],
                                    )));
                          },
                          minLeadingWidth: 50,
                          leading: Image.network(
                            snapshot.data![index].image,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            snapshot.data![index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "Cuisine : ${snapshot.data![index].cuisine}\nDifficulty : ${snapshot.data![index].difficulty}"),
                          trailing: Text(
                            "${snapshot.data![index].rating.toString()} ⭐",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        );
                      });
                }),
          )
        ],
      )),
    );
  }
}