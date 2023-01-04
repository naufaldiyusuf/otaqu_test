import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/page/page_bloc.dart';
import '../constant.dart';
import '../data/data.dart';
import '../helper/helpers.dart';
import '../model/models.dart';

part 'wrapper.dart';
part 'screen/splash_screen.dart';
part 'screen/home_screen.dart';
part 'screen/boarding_screen.dart';
part 'widget/boarding_widget.dart';
part 'widget/home_widget.dart';
part 'screen/avail_screen.dart';
part 'widget/avail_widget.dart';