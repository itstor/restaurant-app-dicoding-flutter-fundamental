import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_fundamental_1/widgets/neumorphic_single_button_widget.dart';
import '../common/constants.dart';

class CurvedAppBarScaffold extends StatelessWidget {
  final Widget? appBarTitle;
  final Color? backgroundColor;
  final Widget? body;
  const CurvedAppBarScaffold(
      {Key? key, this.appBarTitle, this.backgroundColor, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: appBarTitle,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColorOrange[80]!,
              blurRadius: 20,
              offset: const Offset(0, -10),
            ),
          ],
          color: kDefaultBackgroundColor,
        ),
        child: body,
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  const MainAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: kGrayColor[80]!.withOpacity(0.25),
                spreadRadius: 0.0,
                blurRadius: 30.0,
                offset: const Offset(0.0, 15.0),
              )
            ],
          ),
          child: Image.asset(
            'assets/images/profile/profile.png',
            fit: BoxFit.cover,
          ),
        )
      ],
      leading: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: NeumorphicSingleButtonWidget(
          borderRadius: 14,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Not implemented yet'),
              ),
            );
          },
          child: Icon(
            FeatherIcons.menu,
            color: kPrimaryColorOrange[100],
          ),
        ),
      ),
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
