import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: Color(0xFF1C1F2E),
              child: TabBar(
                labelStyle: TextStyle(fontSize: 18, fontFamily: 'GB'),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorWeight: 4,
                indicatorColor: Color(0xffF35383),
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  CustomScrollView _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GB',
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _getRow(ActivityStatus.following),
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GB',
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _getRow(ActivityStatus.likes),
            childCount: 4,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This Week',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GB',
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _getRow(ActivityStatus.followBack),
            childCount: 3,
          ),
        )
      ],
    );
  }

  Widget _getRow(ActivityStatus status) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: Color(0xffF35383), shape: BoxShape.circle),
            ),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 46,
              height: 46,
              child: Image.asset('images/designer.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Nima Naderi',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Started Following',
                      style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12,
                        color: Color(0xffC5C5C5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'You',
                      style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12,
                        color: Color(0xffC5C5C5),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '3min',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 12,
                        color: Color(0xffC5C5C5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            _getActivityRowAction(status)
          ],
        ),
      );

  Widget _getActivityRowAction(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
            ),
            backgroundColor: Color(0xffF35383),
          ),
          onPressed: () {},
          child: Text(
            'Follow',
          ),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
                color: Color(0xffC5C5C5), fontFamily: 'GB', fontSize: 12),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color(0xffC5C5C5), width: 2),
          ),
        );
    }
  }
}
