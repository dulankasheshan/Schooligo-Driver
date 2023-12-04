import 'package:flutter/material.dart';

class LocButton extends StatelessWidget {
  const LocButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.gps_fixed_rounded,
          size: 60,
          color: Colors.white,
        ),
        Text(
          'Turn On Live Location',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

class LocButtonOn extends StatelessWidget {
  const LocButtonOn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.gps_fixed_rounded,
          size: 60,
          color: Colors.white,
        ),
        Text(
          'Turn Off Live Location',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

