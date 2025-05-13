import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/bloc.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

import 'model/cubit/item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://svguqpavelimqbxmzgpl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN2Z3VxcGF2ZWxpbXFieG16Z3BsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcwNjg1MzgsImV4cCI6MjA2MjY0NDUzOH0.nN-SS7I47cdHmlJFpsyolJmceSWgXZQHLZM4tlBRMAQ',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ItemProvider()), // FavoriteProvider
      ],
      child: BlocProvider<FoodCubit>(
        create: (context) => FoodCubit(),
        child: MyApp(), // Main app widget
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
