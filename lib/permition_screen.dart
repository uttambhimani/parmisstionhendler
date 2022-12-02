import 'package:flutter/material.dart';
import 'package:parmisstionhendler/location_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class permition_Screen extends StatefulWidget {
  const permition_Screen({Key? key}) : super(key: key);

  @override
  State<permition_Screen> createState() => _permition_ScreenState();
}

class _permition_ScreenState extends State<permition_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()async{

              Map<Permission,PermissionStatus> map =
              await [Permission.location,Permission.camera,Permission.calendar].request();

              if(await Permission.camera.isDenied){
                print("Camera Deny");
              }
              if(await Permission.location.isDenied){
                print("Location Deny");
              }
              if(await Permission.calendar.isDenied){
                print("Calander Deny");
              }


            }, icon: Icon(Icons.settings)),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
              Provider.of<locationProvider>(context,listen: false).getPosition();
              }, child: Text("Location")),
              SizedBox(height: 50,),
              Text("${Provider.of<locationProvider>(context,listen: true).longi}   / ${Provider.of<locationProvider>(context,listen: true).lati}"),
              SizedBox(height: 30,),
              Text("${Provider.of<locationProvider>(context,listen: true).pl}")
            ],
          ),
        ),
      ),
    );
  }
}
