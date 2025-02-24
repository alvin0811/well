import 'dart:async';

import 'package:chopper/chopper.dart';

const emptyString = '';

typedef SController<T> = StreamController<T>;

typedef S<T> = Stream<T>;

typedef CS = ChopperService;

const mask = '00##-###-#######';
