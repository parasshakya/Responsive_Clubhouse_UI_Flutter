import 'package:clubhouse_flutter/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomWidgetsExporter.dart';
import '../data.dart';

class UpcomingRooms extends StatelessWidget {

  final List<Room> upcomingRoomsList;

  const UpcomingRooms({Key? key, required this.upcomingRoomsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool _isDesktop = Responsive.isDesktop(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _isDesktop ? width/4 : 0.0 ),
      padding: EdgeInsets.fromLTRB(32.0, 4.0, 0.0,4.0),
         decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: upcomingRoomsList.map((Room) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Room.club.isNotEmpty ? 2.0 : 0.0),
                child: Text(Room.time),
              ),
              SizedBox(width: 12.0,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(Room.club.isNotEmpty)
                    Flexible(
                      child: Text('${Room.club} 🏠 '.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.overline!.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),),
                    ),
                    Flexible(
                        child: Text(Room.name,
                        overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              )
            ],
          ),
        )).toList()
      ),
    );
  }
}
