import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getSearchBox(),
              ),
              SliverToBoxAdapter(
                child: _getTopList(),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      QuiltedGridTile(2, 1),
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ],
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(
                              'images/item$index.png',
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSearchBox() => Container(
        height: 46,
        margin: EdgeInsets.only(left: 18, right: 18, top: 12),
        decoration: BoxDecoration(
          color: Color(0xFF272B40),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset('images/icon_search.png'),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search User',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Image.asset('images/icon_scan.png'),
            ],
          ),
        ),
      );

  Widget _getTopList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 24,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF272B40),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  'Nima $index',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'GM',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
