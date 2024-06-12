import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:recipbook/const.dart';
import 'package:recipbook/presentation/pages/recipe_page/recipe_page.dart';
import 'package:recipbook/providers/Recipe_provider.dart';
import 'package:recipbook/services/data_service.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCat = -1;
  String mealType = "";

  TextEditingController searchController = TextEditingController();
  late Future<List<String>?> categoryList;
  late Future<List<Recipe>?> recipeList;
  @override
  void initState() {
    // TODO: implement initState
    DataService dataService = DataService();

    categoryList = dataService.getRecipeCategories();
    recipeList = dataService.getrecipe(mealType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, recipeProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _searchbar(),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 25,
                    child: _categoryTiles(),
                  ),
                  SizedBox(height: 10),
                  _recipeGrid(recipeProvider),
                  SizedBox(height: 15),
                  Text(
                    "New Recipes",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: CupertinoColors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  _newRecipes(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _appBar() => AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: kTextTabBarHeight,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Mhmd SHA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "What are you cooking today?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            )
          ],
        ),
        actions: [
          Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.fill,
              ))
        ],
        centerTitle: false,
      );

  _searchbar() => Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                canRequestFocus: false,
                controller: searchController,
                onTap: () {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    IconlyBroken.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusColor: Colors.greenAccent,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Search recipe',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          SizedBox(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                fixedSize: Size(40, 40),
                backgroundColor: primaryColor,
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Icon(
                IconlyBold.filter,
                size: 20,
              ),
            ),
          ),
        ],
      );

  _categoryTiles() => FutureBuilder(
        future: categoryList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> categories = snapshot.data!;
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCat = -1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedCat == -1 ? primaryColor : null,
                    ),
                    child: Center(
                        child: Text(
                      'All',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: selectedCat == -1 ? Colors.white : primaryColor,
                      ),
                    )),
                  ),
                ),
                SizedBox(width: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCat = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCat == index ? primaryColor : null,
                        ),
                        child: Center(
                            child: Text(
                          category.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: selectedCat == index
                                  ? Colors.white
                                  : primaryColor),
                        )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                ),
              ],
            );
          } else {
            return Shimmer.fromColors(
              baseColor: primaryColor,
              highlightColor: secondaryColor,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    color: primaryColor,
                  ),
                ),
              ),
            );
          }
        },
      );

  _recipeGrid(RecipeProvider recipeProvider) => FutureBuilder(
        future: recipeList,
        builder: (context, snapshot) {
          //
          if (snapshot.hasData) {
            return SizedBox(
              height: 200,
              child: GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 16 / 11,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(RecipePage(recipe: item));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: CupertinoColors.systemFill,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  item.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        CupertinoColors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Time",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: CupertinoColors.systemGrey),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item.cookTimeMinutes.toString()} Mins",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.black
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: IconButton(
                                        splashRadius: 10,
                                        color: primaryColor,
                                        style: IconButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap),
                                        onPressed: () {
                                          recipeProvider.addRecipe(item);
                                        },
                                        icon: Center(
                                          child: Icon(
                                            context.recipeProvider
                                                    .checkSaved(item)
                                                ? IconlyBold.bookmark
                                                : IconlyLight.bookmark,
                                            size: 15,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: 90,
                          child: Center(
                            child: Image.network(
                              item.image,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 15,
                            right: 10,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              decoration: BoxDecoration(
                                color: secondaryColor.withGreen(200),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      IconlyBold.star,
                                      size: 15,
                                      color: secondaryColor,
                                    ),
                                    SizedBox(width: 1),
                                    Text(
                                      "${item.rating.toInt()}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CupertinoColors.black
                                            .withOpacity(0.7),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: primaryColor,
              highlightColor: secondaryColor,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: primaryColor,
                  ),
                ),
              ),
            );
          }
        },
      );

  _newRecipes() => FutureBuilder(
        future: recipeList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 140,
              child: GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 9 / 16,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = snapshot.data![index];
                  return Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CupertinoColors.systemGrey6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.black.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              height: 15,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: item.rating.toInt(),
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Icon(
                                      IconlyBold.star,
                                      color: Colors.amber,
                                      size: 15,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              "Time",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircleAvatar(),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "By James Milner",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: CupertinoColors.systemGrey
                                        .withOpacity(0.7),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  IconlyBroken.timeCircle,
                                  size: 16,
                                  color: CupertinoColors.systemGrey,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "${item.cookTimeMinutes.toString()} Mins",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.systemGrey
                                        .withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        height: 70,
                        padding: EdgeInsets.only(right: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            item.image,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: primaryColor,
              highlightColor: secondaryColor,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: primaryColor,
                  ),
                ),
              ),
            );
          }
        },
      );
}
