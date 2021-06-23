import 'package:clubhouse_flutter/Custom_Widgets/CustomWidgetsExporter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMute;

  const RoomUserProfile({Key? key,required this.imageUrl,
    required this.name,
    this.size = 48.0,
    this.isNew = false,
    this.isMute = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            UserProfileImage(imageUrl: imageUrl,
            size: size,),
            if(isNew)
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,2),
                      blurRadius: 6.0,
                    )
                  ]
                ),
                child: Text(
                  '🎉',
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            if(isMute)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,2),
                      blurRadius: 6.0,
                    )
                  ]
                ),
                child: Icon(
                    CupertinoIcons.mic_off,
                  size: 16,
                ),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
        SizedBox(height: 2.0,),
        Flexible(
            child: Text(
                name,
              overflow: TextOverflow.ellipsis,

            )),
      ],
    );
  }
}
