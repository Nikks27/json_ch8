
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/JsonParsingProvider.dar.dart';


class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: Text('USER JSON',style: TextStyle(color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.w500),),
      ),
      body: ListView.builder(itemCount: userProvider.userData.length,itemBuilder: (context, index) => Card(
        color: Colors.grey.shade800,
        child: ListTile(
          leading: Text(userProvider.userData[index].id.toString(),style: TextStyle(color: Colors.white),),
          title: Text(userProvider.userData[index].name,style: TextStyle(color: Colors.white)),
          subtitle: Text(userProvider.userData[index].company.name,style: TextStyle(color: Colors.white)),
          trailing: Text(userProvider.userData[index].address.city + " " + userProvider.userData[index].address.geo.lng,style: TextStyle(color: Colors.white)),
        ),
      ),),
    );
  }
}