import 'package:flutter/material.dart';


class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {},
          child: const Text('Recovery Password',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
        ),
      ),
    );
  }
}
