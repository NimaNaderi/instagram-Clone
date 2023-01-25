import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1F2E),
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    _getPostHeader(context),
                    SizedBox(
                      height: 24,
                    ),
                    _getPostContent(),
                  ],
                );
              }, childCount: 8),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _getStoryList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  ListView _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            SizedBox(
              height: 34,
            ),
            _getPostHeader(context),
            SizedBox(
              height: 24,
            ),
            _getPostContent(),
          ],
        );
      }),
    );
  }

  Container _getPostContent() {
    return Container(
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('images/post_cover.png'),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  height: 46,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, .5),
                        Color.fromRGBO(255, 255, 255, .2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.5 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42),
                      Image.asset('images/icon_share.png'),
                      SizedBox(width: 42),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getPostHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nima Naderi',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: 'GM'),
                ),
                Text(
                  'نیما برنامه نویس موبایل',
                  style: TextStyle(color: Colors.white, fontFamily: 'SM'),
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: DraggableScrollableSheet(
                      initialChildSize: .4,
                      minChildSize: .2,
                      maxChildSize: .7,
                      builder: (context, scrollController) {
                        return ShareBottomSheet(
                          scrollController: scrollController,
                        );
                      },
                    ),
                  );
                },
              );
            },
            child: Image.asset('images/icon_menu.png'),
          )
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(16),
      padding: EdgeInsets.all(4),
      color: Color(0xFFF35383),
      dashPattern: [50, 10],
      strokeWidth: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/designer.png'),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(16),
            padding: EdgeInsets.all(2),
            color: Color(0xFFF35383),
            dashPattern: [50, 10],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 60,
                width: 60,
                child: Image.asset('images/designer.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Testing',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: Image.asset('images/icon_plus.png'),
        ),
        Text(
          'Your Story',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
