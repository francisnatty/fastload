import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fastload/Screens/chatApp/chat.dart';
import 'package:fastload/Screens/home/home_screen.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/bloc/auth/auth_bloc.dart';
import 'package:fastload/bloc/auth/auth_repo.dart';
import 'package:fastload/constants/variables.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/global/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HydratedBloc.storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(
    mtnRepository: MtnRepository(),
    connectivity: Connectivity(),
    authRepository: AuthRepository(),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final MtnRepository mtnRepository;
  final AuthRepository authRepository;
  const MyApp(
      {super.key,
      required this.connectivity,
      required this.mtnRepository,
      required this.authRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DataBloc(mtnRepository: mtnRepository)),
        BlocProvider(
            create: (context) => AuthBloc(authRepository: authRepository))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        scaffoldMessengerKey: snackbarKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: fontName,
          useMaterial3: true,
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
