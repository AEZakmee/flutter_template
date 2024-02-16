import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/extensions.dart';
import '../welcome_viewmodel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: context.colors.surfaceColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: context.read<WelcomeViewModel>().logIn,
                child: Text(context.localizations.login),
              ),
              const Text('Flavor $appFlavor'),
            ],
          ),
        ),
      );
}
