import 'package:flutter/material.dart';

class TextSmall extends StatelessWidget {
  final String text;

  const TextSmall({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  final String text;

  const TextMedium({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    );
  }
}


class TextLarge extends StatelessWidget {
  final String text;

  const TextLarge({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    );
  }
}


class TextTitleSmall extends StatelessWidget {
  final String text;

  const TextTitleSmall({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.666,
      ),
    );
  }
}

class TextTitleMedium extends StatelessWidget {
  final String text;

  const TextTitleMedium({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
      ),
    );
  }
}

class TextTitleLarge extends StatelessWidget {
  final String text;

  const TextTitleLarge({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
    );
  }
}

