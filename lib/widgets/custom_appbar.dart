import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({
    Key? key, required this.title, required this.isLeading,
  }) : super(key: key);
  final String title;
  final bool isLeading;
  @override
  Widget build(BuildContext context)  {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: isLeading,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
        child: Text(title,style: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(color: Colors.white),),),
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(onPressed: (){
                Navigator.pushNamed(context, '/wishlist');
              }, icon: const Icon(Icons.favorite))
            ],
    );
  }
  
  @override
 
  Size get preferredSize => const Size.fromHeight(50);
}