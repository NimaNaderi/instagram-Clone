import 'package:flutter/material.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  int selectedImageID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: Stack(
          children: [
            _getWholeScrollingPart(),
            _getHeaderSection(),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 84,
                decoration: BoxDecoration(
                  color: Color(0xFF272B40),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Draft',
                        style: TextStyle(
                          color: Color(0xFFF35383),
                          fontSize: 18,
                          fontFamily: 'GB',
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'GB',
                        ),
                      ),
                      Text(
                        'Take',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'GB',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _getWholeScrollingPart() {
    return Padding(
      padding: const EdgeInsets.only(top: 76),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
            sliver: SliverToBoxAdapter(
              child: _getSelectedImageContainer(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  child: GestureDetector(
                    onTap: (() {
                      setState(() {
                        selectedImageID = index;
                      });
                    }),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          color: index == selectedImageID
                              ? Colors.grey.withOpacity(.5)
                              : null,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'images/item$index.png',
                              fit: BoxFit.cover,
                            ),
                            Visibility(
                              visible: index == selectedImageID,
                              child: Icon(
                                Icons.done,
                                size: 56,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                childCount: 15,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 100),
          )
        ],
      ),
    );
  }

  Container _getSelectedImageContainer() {
    return Container(
      width: double.infinity,
      height: 376,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(
            'images/item$selectedImageID.png',
          ),
        ),
      ),
    );
  }

  Padding _getHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset('images/icon_arrow_down.png')
            ],
          ),
          Row(
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Image.asset('images/icon_arrow_right_box.png')
            ],
          ),
        ],
      ),
    );
  }
}
