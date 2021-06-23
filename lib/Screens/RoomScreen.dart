import 'dart:math';

import 'package:clubhouse_flutter/Custom_Widgets/CustomWidgetsExporter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse_flutter/data.dart';

class RoomScreen extends StatelessWidget {
final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isDesktop = Responsive.isDesktop(context);
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      leadingWidth: 120.0,
      leading: TextButton.icon(
        style: TextButton.styleFrom(primary: Colors.black),
        label: Text('All rooms'),
        icon: Icon(CupertinoIcons.chevron_down),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: _isDesktop ? 60 : 0),
          child: IconButton(
            icon: Icon(CupertinoIcons.doc),
          onPressed: (){},),
        ),
        Container(
          margin: EdgeInsets.only(right: _isDesktop ? 60 : 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserProfileImage(imageUrl: currentUser.imageUrl,
            size: 38.0,),
          ),
        )
      ],
    ),
      body: _isDesktop ?  Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 600.0 ,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${room.club} 🏠 '.toUpperCase(), style: Theme.of(context).textTheme.overline!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          letterSpacing: 1.0,
                        ),),
                        Icon(
                            Icons.more_horiz
                        )
                      ],
                    ),
                    SizedBox(height: 4.0,),
                    Text(room.name,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12.0,)),
              SliverPadding(
                padding: EdgeInsets.all(12.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  children: room.speakers.map((speaker)=> RoomUserProfile(
                    imageUrl: speaker.imageUrl,
                    name: speaker.givenName,
                    size: 70.0,
                    isNew: Random().nextBool(),
                    isMute: Random().nextBool(),
                  )).toList(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 20.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Followed by Speakers',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20.0),
                sliver: SliverGrid.count(crossAxisCount: 4,
                mainAxisSpacing: 20.0,
                children: room.followedBySpeakers.map((followedByspeaker) => RoomUserProfile(imageUrl: followedByspeaker.imageUrl,
                    name: followedByspeaker.givenName,
                size: 70,
                  isNew: Random().nextBool(),
                )).toList(),),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 20.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Others in Room',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20.0),
                sliver: SliverGrid.count(crossAxisCount: 4,
                  mainAxisSpacing: 20.0,
                  children: room.others.map((others) => RoomUserProfile(imageUrl: others.imageUrl,
                    name: others.givenName,
                    size: 70,
                    isNew: Random().nextBool(),
                    isMute: Random().nextBool(),
                  )).toList(),),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 60.0),),
            ],
          )
        ),
      ) :  Container(
          height: MediaQuery.of(context).size.height,
          width:  double.infinity,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${room.club} 🏠 '.toUpperCase(), style: Theme.of(context).textTheme.overline!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          letterSpacing: 1.0,
                        ),),
                        Icon(
                            Icons.more_horiz
                        )
                      ],
                    ),
                    SizedBox(height: 4.0,),
                    Text(room.name,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12.0,)),
              SliverPadding(
                padding: EdgeInsets.all(12.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  children: room.speakers.map((speaker)=> RoomUserProfile(
                    imageUrl: speaker.imageUrl,
                    name: speaker.givenName,
                    size: 60.0,
                    isNew: Random().nextBool(),
                    isMute: Random().nextBool(),
                  )).toList(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 20.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Followed by Speakers',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20.0),
                sliver: SliverGrid.count(crossAxisCount: 4,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.7,
                  children: room.followedBySpeakers.map((followedByspeaker) => RoomUserProfile(imageUrl: followedByspeaker.imageUrl,
                    name: followedByspeaker.givenName,
                    size: 60,
                    isNew: Random().nextBool(),
                  )).toList(),),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 20.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Others in Room',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20.0),
                sliver: SliverGrid.count(crossAxisCount: 4,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.7,
                  children: room.others.map((others) => RoomUserProfile(imageUrl: others.imageUrl,
                    name: others.givenName,
                    size: 60,
                    isNew: Random().nextBool(),
                    isMute: Random().nextBool(),
                  )).toList(),),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 60.0),),
            ],
          )
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,
        vertical: 12.0),
        height: 90.0,
        child: Row(
          mainAxisAlignment: _isDesktop ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Text.rich(
                  TextSpan(
                    children:[
                            TextSpan(
                              text: '✌️',
                              style: TextStyle(
                                fontSize: 22.0,
                              )
                            ),
                      TextSpan(
                        text: 'Leave quietly',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        )
                      )
                    ]
                  )
                ),
              ),
            ),
            _isDesktop ? SizedBox(width: 12.0,) : SizedBox.shrink(),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    CupertinoIcons.add,
                    size: 30.0,
                  ),
                ),
                SizedBox(width: 12.0,),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    CupertinoIcons.hand_raised,
                    size: 30.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
