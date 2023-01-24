import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18, top: 18),
                    child: Icon(Icons.menu),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color(0xff1c1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Color(0xff1C1F2E),
                expandedHeight: 170,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getProfileHeader(),
              ),
              SliverPersistentHeader(
                delegate: TabBarViewDelegate(
                  TabBar(
                    padding: EdgeInsets.only(bottom: 6),
                    indicatorWeight: 2,
                    indicatorColor: Color(0xffF35383),
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
                pinned: true,
                floating: true,
              )
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                    sliver: SliverGrid(
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
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
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                    sliver: SliverGrid(
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _getProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color(0xffF35383),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: FittedBox(
                  child: Image.asset('images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نیما نادری',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SM',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Nima Naderi',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GB',
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png')
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
