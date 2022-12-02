import 'package:flutter/material.dart';
import 'package:parmisstionhendler/location_provider.dart';
import 'package:parmisstionhendler/permition_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (context)=>locationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>permition_Screen(),
        },
      ),
    )
  );
}