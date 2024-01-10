import 'package:fastload/Screens/home/home_screen.dart';
import 'package:fastload/bloc/dataPlanBloc/data_repo.dart';
import 'package:fastload/bloc/auth/auth_bloc.dart';
import 'package:fastload/bloc/auth/auth_repo.dart';
import 'package:fastload/bloc/tv/tv_bloc.dart';
import 'package:fastload/constants/variables.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/cubit/airtime/airtime_cubit.dart';
import 'package:fastload/datasource/airtime_datasource.dart';
import 'package:fastload/datasource/data_datasource.dart';
import 'package:fastload/datasource/tv_datasource.dart';
import 'package:fastload/global/global_functions.dart';
import 'package:fastload/repository/airtime_repo.dart';
import 'package:fastload/repository/tv_repo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AirtimeCubit(
                  airtimeRepository: AirtimeRepository(
                      airtimeDataSource: AirtimeDataSource()))),
          BlocProvider(
              create: (context) => DataBloc(
                  dataRepository:
                      DataRepository(dataDataSource: DataDataSource()))),
          BlocProvider(
              create: (context) => AuthBloc(authRepository: AuthRepository())),
          BlocProvider(
              create: (context) => TvBloc(
                  tvRepository: TvRepository(tvDataSource: TvDataSource())))
        ],
        child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: const Size(412, 868),
          builder: (_, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              scaffoldMessengerKey: snackbarKey,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                fontFamily: fontName,
                useMaterial3: true,
              ),
              home: const HomeScreen(),
            );
          },
        ));
  }
}
