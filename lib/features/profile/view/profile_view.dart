import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    //final bloc = BlocProvider.of<ProfileCubit>(context, listen: false);
    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: () {
              //bloc.changeTheme();
            },
            child: const Text('Change'),
          ),
        )
      ],
    );
  }
}
