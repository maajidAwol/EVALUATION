import 'package:assesment_app/features/grocery/presentation/blocs/details/bloc/details_bloc.dart';
import 'package:assesment_app/features/grocery/presentation/views/basket.dart';
import 'package:assesment_app/features/grocery/presentation/views/details.dart';
import 'package:assesment_app/features/grocery/presentation/views/splash.dart';
import 'package:assesment_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/grocery/presentation/blocs/home/bloc/home_bloc.dart';
import 'features/grocery/presentation/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const RootPage());
}







class RootPage extends StatelessWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<HomeBloc>()..add(FetchGroceries()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<DetailsBloc>(),
        ),
        
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        debugShowCheckedModeBanner: false,

        home: Splash(),
       
        routes: {
          '/home': (context) => Home(),
          '/details': (context) => Details(),
          '/basket': (context) => Basket(),

      
        },
      ),
    );
  }
}
