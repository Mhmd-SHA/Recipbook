import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:recipbook/const.dart';
import 'package:recipbook/providers/Recipe_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Text("Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
              fontSize: 18,
            )),
        centerTitle: true,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/avatar.png",
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Recipe",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "4",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Followers",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "2.5M",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Follwing",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "259",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Mhmd SHA",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "Chef",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Private Chef\nPassionate about food and life 🥘🍲🍝🍱",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
            Text(
              "More...",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: primaryColor,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Durations.long4,
                      padding: EdgeInsets.all(8),
                      decoration: selectedindex == 0
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                            )
                          : null,
                      child: Center(
                        child: Text(
                          "Recipe",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedindex == 0
                                ? Colors.white
                                : primaryColor.withOpacity(0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = 1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Durations.long4,
                      padding: EdgeInsets.all(8),
                      decoration: selectedindex == 1
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                            )
                          : null,
                      child: Center(
                        child: Text(
                          "Videos",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedindex == 1
                                ? Colors.white
                                : primaryColor.withOpacity(0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = 2;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Durations.long4,
                      padding: EdgeInsets.all(8),
                      decoration: selectedindex == 2
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                            )
                          : null,
                      child: Center(
                        child: Text(
                          "Tag",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedindex == 2
                                ? Colors.white
                                : primaryColor.withOpacity(0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: context.recipeProvider.savedRecipes.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = context.recipeProvider.savedRecipes[index];
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
              ),
            )
            //
          ],
        ),
      ),
    );
  }
}
