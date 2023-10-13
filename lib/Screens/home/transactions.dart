import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: lightBlack.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Last Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 7,
            ),
            Expanded(
              child: ListView.builder(
                  // padding: EdgeInsets.only(bottom: 10),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      leading: SizedBox(
                        height: 60,
                        width: 60,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black87),
                          child: const Icon(
                            Icons.air,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Airtime',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('purchased airtime'),
                      trailing: const Column(
                        children: [
                          Text(
                            'N100',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red),
                          ),
                          Text('10/20/2023'),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
