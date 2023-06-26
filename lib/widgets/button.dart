import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final VoidCallback onClicked;
  final defaulttext;
  final icon;

  const DashboardButton({
    Key? key,
    required this.onClicked,
    required this.defaulttext,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color(0xffFF6700),
            fixedSize: const Size(250, 48),
            textStyle: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: 'Poppins-regular',
              fontWeight: FontWeight.w700,
            )),
        onPressed: onClicked,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            Text(
              defaulttext,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              size: 28,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
          ],
        ),
      );
}

// refresh button for internal pages
class RefreshButton extends StatelessWidget {
  final VoidCallback onClicked;
  final defaulttext;

  const RefreshButton({
    Key? key,
    required this.onClicked,
    required this.defaulttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color(0xffFF6700),
            fixedSize: const Size(250, 48),
            textStyle: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: 'Poppins-regular',
              fontWeight: FontWeight.w700,
            )),
        onPressed: onClicked,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            const Icon(
              Icons.refresh_outlined,
              size: 28,
              color: Colors.white,
            ),
            const SizedBox(width: 14),
            Text(
              defaulttext,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      );
}

// padding text

class PaddingTextfour extends StatelessWidget {
  final text;

  const PaddingTextfour({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xff303135),
            fontFamily: 'Poppins',
          ),
        ),
      );
}
