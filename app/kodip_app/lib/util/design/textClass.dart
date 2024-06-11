import 'package:flutter/material.dart';
import 'package:sampl/util/design/color.dart';

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
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: colorBlack(context),
        height: 1.4,
        overflow: TextOverflow.ellipsis
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
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colorBlack(context),
        height: 1.5,
        overflow: TextOverflow.ellipsis
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
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colorBlack(context),
        height: 1.5,
        overflow: TextOverflow.ellipsis
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
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: colorBlack(context),
        height: 1.666,
        overflow: TextOverflow.ellipsis
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
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colorBlack(context),
        height: 1.25,
        overflow: TextOverflow.ellipsis
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
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colorBlack(context),
        height: 1.4,
        overflow: TextOverflow.ellipsis
      ),
    );
  }
}

class TextMediumSeoulNamsan extends StatelessWidget {
  final String text;

  const TextMediumSeoulNamsan({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontFamily: "SeoulNamsan",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colorBlack(context),
        height: 1.4,
          overflow: TextOverflow.ellipsis
      ),
    );
  }
}