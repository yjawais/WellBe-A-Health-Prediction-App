// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String route;
  const MainCard(
    this.image,
    this.title,
    this.description,
    this.route, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
          height: 135.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(left: 44.0),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(description),
                    ],
                  ),
                ),
                height: 124.0,
                width: 260,
                margin: const EdgeInsets.only(left: 46.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff46b3e6),
                      Color(0xfface5ff),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow:const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
              ),
              Container(
                height: 95.0,
                width: 95.0,
                decoration: const BoxDecoration(
                  // image: DecorationImage(image: AssetImage("assets/images/Rectangle 22.png"),),

                  shape: BoxShape.circle,
                  color: Color(0xfface5ff),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: FractionalOffset.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    image,
                    height: 95.0,
                    width: 95.0,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
