import 'package:elevate_task/features/Home/Logic/product_cubit.dart';
import 'package:elevate_task/features/Home/Ui/Widget/product/productItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/Di/di.dart';

import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setGetIt();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<ProductCubit>()..loadAllProduct()),
      ],
      child: const MyApp(),
    ),
  );
}
