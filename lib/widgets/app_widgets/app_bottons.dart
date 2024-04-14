import 'package:flutter/material.dart';

Widget gradiantButton(){
  return  ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: Material(
      child: InkWell(
        onTap: () {
          //Navigator.of(ctx).pushNamed(SignUpScreenSecond.routeName);
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                colors: [
                  Colors.green,
                  Colors.grey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: const Center(
              child: Text(
                'Validate',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    ),
  );
}