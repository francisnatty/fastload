import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/Screens/buyData/mtn_repository.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/cubit/data_bloc.dart';
import 'package:fastload/cubit/data_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MtnBlocSreen extends StatefulWidget {
  const MtnBlocSreen({super.key});

  @override
  State<MtnBlocSreen> createState() => _MtnBlocSreenState();
}

class _MtnBlocSreenState extends State<MtnBlocSreen> {
  // final MtnRepository mtnRepository;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            DataBloc(mtnRepository: MtnRepository())..add(FetchDataPlans()),
        child: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else if (state is DataSocketError) {
            return CupertinoAlertDialog(
              title: const Text(
                'Poor internet Connection',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 17),
              ),
              content: Text(
                'Pls check your connection and try again',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.green),
                  child: const Text('Ok'),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<DataBloc>(context).reloadState();
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Retry'),
                )
              ],
            );
          } else if (state is DataError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is DataLoaded) {
            ServiceData dataPlans = state.dataPlans;
            return Text(dataPlans.serviceID);
          }
          return Container(
            child: const Text('Error'),
          );
        }),
      ),
    );
  }
}
