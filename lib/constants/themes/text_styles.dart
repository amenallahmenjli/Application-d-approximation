import 'package:flutter/material.dart';

import '../colors.dart';

TextStyle generalTextStyle = const TextStyle(
  fontFamily: 'Poppins',
);

TextStyle appBarTextStyle = generalTextStyle.merge(const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
));

TextStyle appBarTextStyleDark = appBarTextStyle.merge(const TextStyle(
  color: lightColor,
));

TextStyle appBarTextStyleLight = appBarTextStyle.merge(const TextStyle(
  color: darkColor,
));
