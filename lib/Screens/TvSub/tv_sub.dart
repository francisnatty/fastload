import 'package:fastload/Screens/TvSub/Api/tv_api.dart';
import 'package:flutter/material.dart';

class TvSub extends StatefulWidget {
  const TvSub({super.key});

  @override
  State<TvSub> createState() => _TvSubState();
}

class _TvSubState extends State<TvSub> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TvApi().getAllSubs();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
