import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:recipbook/providers/Recipe_provider.dart';

import '../../../const.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, RecipeProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Saved Recipes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                  fontSize: 18,
                )),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: RecipeProvider.savedRecipes.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = RecipeProvider.savedRecipes[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              image: NetworkImage(
                                item.image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      item.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CupertinoColors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      item.cuisine,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: CupertinoColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
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
                                        "${item.cookTimeMinutes.toString()} Mins",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.white
                                              .withOpacity(0.7),
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
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                            onPressed: () {
                                              // RecipeProvider.addRecipe(item);
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                                          "${item.rating.toInt()}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.white
                                                .withOpacity(0.7),
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
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
