import 'package:clubhouse_flutter/Custom_Widgets/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse_flutter/Custom_Widgets/CustomWidgetsExporter.dart';
import '../data.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bool _isDesktop = Responsive.isDesktop(context);
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: _isDesktop ? null : IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 28.0,
          ),
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: _isDesktop ? width/6 : 0),
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.envelope_open,
                size: 28.0,
              ),
              onPressed: (){},
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: _isDesktop ? width/6 : 0),
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.calendar,
                size: 28.0,
              ),
              onPressed: (){},
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: _isDesktop ? width/6 : 0),
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.bell,
                size: 28.0,
              ),
              onPressed: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,10.0,20.0,10.0),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.only(right: _isDesktop ? width/6 : 0),
                child: UserProfileImage(
                    imageUrl: currentUser.imageUrl,
                    size: 36.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Responsive(
        desktop: HomeScreenDesktop(),
        mobile: HomeScreenMobile(),
      ),

    );
  }
}
class HomeScreenMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
          children: [
            UpcomingRooms(upcomingRoomsList: upcomingRoomsList),
            SizedBox(height: 12.0,),
            ...roomsList.map((room) => RoomCard(room: room)).toList(),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ]
                )
            ),
          ),
        ),
        Positioned(
            bottom: 60.0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Text.rich(
                  TextSpan(
                      children:
                      [
                        WidgetSpan(
                          child: Icon(
                            CupertinoIcons.add,
                            size: 21.0,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: 'Start a room',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0
                            )
                        )
                      ]
                  )
              ),
            )),
        Positioned(
            bottom: 60.0,
            right:  40.0,
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.circle_grid_3x3_fill,
                    size: 28.0,
                  ),
                  onPressed: (){},
                ),
                Positioned(
                  right: 4.6,
                  bottom: 11.8,
                  child: Container(
                    height: 16.0,
                    width: 16.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
          children: [
            UpcomingRooms(upcomingRoomsList: upcomingRoomsList),
            SizedBox(height: 12.0,),
            ...roomsList.map((room) => RoomCard(room: room)).toList(),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ]
                )
            ),
          ),
        ),
        Positioned(
            bottom: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.search,
                    size: 28.0,
                  ),
                  onPressed: (){},
                ),
                SizedBox(width: 32.0,),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Text.rich(
                      TextSpan(
                          children:
                          [
                            WidgetSpan(
                              child: Icon(
                                CupertinoIcons.add,
                                size: 21.0,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                                text: 'Start a room',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0
                                )
                            )
                          ]
                      )
                  ),
                ),
                SizedBox(width: 32.0,),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.circle_grid_3x3_fill,
                        size: 28.0,
                      ),
                      onPressed: (){},
                    ),
                    Positioned(
                      right: 4.6,
                      bottom: 11.8,
                      child: Container(
                        height: 16.0,
                        width: 16.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}

