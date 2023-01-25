import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: DefaultTabController(
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
                SliverToBoxAdapter(
                  child: _getProfileHeaderTextContent(),
                ),
                SliverToBoxAdapter(
                  child: _getProfileHeaderButtons(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 90,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return index == 0
                            ? _getAddHighlightBox()
                            : _getHighlightBox(index);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                    ),
                  ),
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
      ),
    );
  }

  Padding _getProfileHeaderButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 166,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Follow',
                style: TextStyle(fontFamily: 'GB', fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: 166,
            height: 46,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: BorderSide(
                  color: Color(0xffC5C5C5),
                  width: 2,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Message',
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _getProfileHeaderTextContent() {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 196,
            child: Text(
              'برنامه نویس فلاتر و اندروید ، تخصص برنامه نویسی یعنی آینده و تاثیر گذاری شغل. آموزش رایگان',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SM',
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset('images/link.png'),
              SizedBox(
                width: 6,
              ),
              Text(
                'yek.link/Nima',
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 14,
                  color: Color(0xff55B9F7),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('images/work.png'),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'developer',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 14,
                      color: Color(0xffC5C5C5),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('images/location.png'),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'IRAN',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 14,
                      color: Color(0xffC5C5C5),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                '23',
                style: TextStyle(
                  fontFamily: 'GB',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'Posts',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontSize: 12,
                  fontFamily: 'GM',
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '16.2K',
                style: TextStyle(
                  fontFamily: 'GB',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'Followers',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontSize: 12,
                  fontFamily: 'GM',
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '280',
                style: TextStyle(
                  fontFamily: 'GB',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'Following',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontSize: 12,
                  fontFamily: 'GM',
                ),
              ),
            ],
          )
        ],
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: FittedBox(
                child: Image.asset('images/designer.png'),
                fit: BoxFit.cover,
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
                    'نیما برنامه نویس موبایل',
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

  Widget _getHighlightBox(int index) {
    List<String> highlightNames = [
      'Flutter VIP',
      'Support',
      'Shopping',
      'Project'
    ];
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset('images/item_profile_${index + 1}.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          highlightNames[index - 1],
          style: TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
    );
  }

  Widget _getAddHighlightBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: Image.asset('images/icon_plus.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'New',
          style: TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
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
