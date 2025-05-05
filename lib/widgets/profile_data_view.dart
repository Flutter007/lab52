import 'package:flutter/material.dart';
import 'package:lab52/widgets/image_container.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

class ProfileDataView extends StatefulWidget {
  const ProfileDataView({super.key});

  @override
  State<ProfileDataView> createState() => _ProfileDataViewState();
}

class _ProfileDataViewState extends State<ProfileDataView> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final theme = Theme.of(context);
    final titleLarge = theme.textTheme.titleLarge;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageContainer(image: user!.image),
        SizedBox(height: 20),
        Text('Name :${user.name}', style: titleLarge),
        SizedBox(height: 10),
        Text('Last name : ${user.lastName}', style: titleLarge),
        SizedBox(height: 10),
        Text('Age : ${user.age}', style: titleLarge),
        SizedBox(height: 10),
        Text('Gender : ${user.gender.toUpperCase()}', style: titleLarge),
        SizedBox(height: 10),
        Text('Location : ${user.location}', style: titleLarge),
      ],
    );
  }
}
