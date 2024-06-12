import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recipbook/models/recipe.dart';
import 'package:recipbook/providers/Recipe_provider.dart';

import '../../../const.dart';

class RecipePage extends StatefulWidget {
  RecipePage({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> with TickerProviderStateMixin {
  // late TabController tabController;

  // @override
  // void initState() {
  //   tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: IconButton(
          iconSize: 25,
          style: IconButton.styleFrom(backgroundColor: CupertinoColors.white),
          onPressed: () {
            Get.back();
          },
          icon: Icon(IconlyBroken.arrowLeft2),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBroken.moreCircle,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(
                      widget.recipe.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 1,
                        right: 10,
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.timeCircle,
                              size: 16,
                              color: CupertinoColors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.recipe.cookTimeMinutes.toString()} Mins",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                  splashRadius: 10,
                                  color: primaryColor,
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap),
                                  onPressed: () {
                                    // RecipeProvider.addRecipe(item);
                                  },
                                  icon: Center(
                                    child: Icon(
                                      context.recipeProvider
                                              .checkSaved(widget.recipe)
                                          ? IconlyBold.bookmark
                                          : IconlyLight.bookmark,
                                      size: 15,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 1,
                        right: 10,
                        child: Container(
                          height: 20,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: secondaryColor.withGreen(200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconlyBold.star,
                                size: 16,
                                color: secondaryColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${widget.recipe.rating.toInt()}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            //
            Text(
              widget.recipe.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
                fontSize: 17,
              ),
            ),
            Text(
              widget.recipe.cuisine,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/avatar.png",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mhmd SHA",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Srilanka",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Follow",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  unselectedLabelColor: primaryColor,
                  // dividerColor: primaryColor,
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: (value) {
                    print(value);
                  },
                  tabs: [
                    Tab(
                      child: Center(
                        child: Text("Ingredients",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text(
                          "Procedure",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                // physics: ScrollPhysics(),
                children: [
                  ////////
                  //ingredients part
                  SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.bowlFood,
                                color: CupertinoColors.systemGrey,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${widget.recipe.servings} serve",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${widget.recipe.ingredients.length} Ingredients",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: CupertinoColors.systemGrey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          ...widget.recipe.ingredients
                              .map((e) => Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.systemFill,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          child: Icon(
                                            FontAwesomeIcons.bowlFood,
                                            color: Colors.black54,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          e,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  ),

                  ////////
                  //procudure part

                  SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.bowlFood,
                                color: CupertinoColors.systemGrey,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${widget.recipe.servings} serve",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${widget.recipe.instructions.length} Steps",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: CupertinoColors.systemGrey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          ...widget.recipe.instructions
                              .map((e) => Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.systemFill,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Step ${widget.recipe.instructions.indexOf(e) + 1}",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          e,
                                          style: TextStyle(
                                            color: CupertinoColors.systemGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
