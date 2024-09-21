import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/features/home_page/presentation/cubit/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    context.read<HomePageCubit>().changeName(value);
                  },
                ),
                state.isTrue()
                    ? Text(
                        "${state.name}",
                      )
                    : const Text("no data found"),
              ],
            ),
          );
        },
      ),
    );
  }
}
