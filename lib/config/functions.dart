import 'package:flutter/material.dart';

class Functions {
  static showLoadingSheet({required BuildContext ctxt}) {
    return showModalBottomSheet(
        context: ctxt,
        backgroundColor: Colors.transparent,
        builder: (ctxt) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(ctxt).size.height,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset('assets/images/loading.gif'),
                ),
                const SizedBox(
                  height: 230,
                )
              ],
            ),
          );
        });
  }
}
