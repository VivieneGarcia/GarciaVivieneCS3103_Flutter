import 'package:flutter/material.dart';

class ImmutableWidget extends StatelessWidget {
  const ImmutableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 180, 180, 180),
              border: Border.all(
                color: const Color.fromARGB(147, 44, 44, 44),
                width: 4,
              ),
            ),
            child: const Center(
                child: Text('VG',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 65, 65, 65),
                    )))),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: const Text(
            'Viviene C. Garcia',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        const Text('+63 123-459-6788', style: TextStyle(fontSize: 16)),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: const Text('12-3456@g.batstate-u.edu.ph',
                style: TextStyle(fontSize: 16))),
        Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 239, 239),
              border: Border.all(
                color: const Color.fromARGB(255, 143, 143, 143),
                width: 2,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: const Text('Draw for a living.',
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ))
      ],
    );
  }
}
