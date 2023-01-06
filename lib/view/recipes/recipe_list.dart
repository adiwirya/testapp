import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/common/configs/config.dart';
import 'package:testapp/view/widgets/custom_dropdown.dart';
import 'package:testapp/view/colors.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  static const String prefSearchKey = 'previousSearches';
  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();
  List currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  // TODO: Add _currentRecipes1

  @override
  void initState() {
    super.initState();
    // TODO: Call loadRecipes()

    void getPreviousSearches() async {
      // 1
      final prefs = await SharedPreferences.getInstance();
      // 2
      if (prefs.containsKey(prefSearchKey)) {
        // 3
        final searches = prefs.getStringList(prefSearchKey);
        // 4
        if (searches != null) {
          previousSearches = searches;
        } else {
          previousSearches = <String>[];
        }
      }
    }

    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final triggerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
  }

  // TODO: Add loadRecipes

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  // TODO: Add getPreviousSearches

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildSearchCard(),
            _buildRecipeLoader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            // Replace
            const Icon(Icons.search),
            const SizedBox(
              width: 6,
            ),
            // *** Start Replace
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                      autofocus: false,
                      controller: searchTextController,
                      onChanged: (query) => {
                        if (query.length >= 3)
                          {
                            // Rebuild list
                            setState(
                              () {
                                currentSearchList.clear();
                                currentCount = 0;
                                currentEndPosition = pageCount;
                                currentStartPosition = 0;
                              },
                            )
                          }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // *** End Replace
          ],
        ),
      ),
    );
  }

  // TODO: Add startSearch

  // TODO: Replace method
  Widget _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return Container();
    }
    // Show a loading indicator while waiting for the movies
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // TODO: Add _buildRecipeCard
}