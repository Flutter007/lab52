import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/user_provider.dart';

class ProfileDataView extends StatefulWidget {
  const ProfileDataView({super.key});

  @override
  State<ProfileDataView> createState() => _ProfileDataViewState();
}

class _ProfileDataViewState extends State<ProfileDataView> {
  late User? user;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = context.read<UserProvider>().user;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(user!.image),
        SizedBox(height: 20),
        Text('Name :${user!.name}', style: theme.textTheme.titleLarge),
        SizedBox(height: 10),
        Text(
          'Last name : ${user!.lastName}',
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 10),
        Text('Age : ${user!.age}', style: theme.textTheme.titleLarge),
        SizedBox(height: 10),
        Text('Gender : ${user!.gender}', style: theme.textTheme.titleLarge),
      ],
    );
  }
}
