import 'package:flutter/material.dart';
import 'package:flutter_fundamental_1/widgets/curved_appbar_scaffold.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  const EmptyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBarScaffold(
      appBarTitle: Center(
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
      ),
      backgroundColor: Colors.amber[800],
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: Text('Not implemented yet'),
      ),
    );
  }
}
