import 'package:clubhouse_flutter/Custom_Widgets/CustomWidgetsExporter.dart';
import 'package:clubhouse_flutter/Screens/RoomScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomCard extends StatelessWidget {
final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool _isDesktop = Responsive.isDesktop(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => RoomScreen(
              room: room,
            )
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: _isDesktop ? width/4 : 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text('${room.club}  🏠 '.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.overline!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                    letterSpacing: 1.0,
                  ),),
                ),
                SizedBox(height: 8.0,),
                Flexible(
                  child: Text(room.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 12.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28.0,
                              top: 20.0,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageUrl,
                                size: 48.0,
                              ),
                            ),
                            UserProfileImage(imageUrl: room.speakers[0].imageUrl, size: 48.0,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map((speaker) => Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                                '${speaker.givenName} ${speaker.familyName} 💬'),
                          ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                              children:
                                [
                                  TextSpan(
                                    text: '${room.speakers.length + room.followedBySpeakers.length + room.others.length}'
                                  ),
                                  WidgetSpan(
                                    child:
                                      Icon(
                                        CupertinoIcons.person_fill,
                                        size: 18.0,
                                        color: Colors.grey,
                                      )
                                  ),
                                  TextSpan(
                                    text: '/ ${room.speakers.length}'
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    )
                                  )
                                ]
                            )
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

