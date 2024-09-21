import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/features/home_page/data/model/taskly_response_model.dart';
import 'package:taskly/features/home_page/presentation/cubit/home_page_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box<TasklyResponseModel>? box;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Taskly"),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            addTodoTaskPopUpWidget(context);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
              future: Hive.openBox<TasklyResponseModel>("task"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  box = snapshot.data;
                  List<int> keys = box!.keys.cast<int>().toList();
                  List<TasklyResponseModel> list = box!.values.toList();
                  return taskList(keys, list);
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget taskList(List<int> keys, List<TasklyResponseModel> list) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(1),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () {
                setState(() {
                  // Delete using the key instead of the index
                  box!.delete(keys[index]);
                });
              },
              isThreeLine: true,
              title: Text(
                list[index].content,
                style: list[index].status
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black,
                      )
                    : const TextStyle(color: Colors.black),
              ),
              subtitle: Text(list[index].dateTime),
              trailing: InkWell(
                onTap: () {
                  box!.put(
                      keys[index],
                      TasklyResponseModel(
                          content: list[index].content,
                          dateTime: list[index].dateTime,
                          status: !list[index].status));
                  context.read<HomePageCubit>().changeStatus(!state.status);
                },
                child: list[index].status
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            );
          },
        );
      },
    );
  }

  Future<Widget> addTodoTaskPopUpWidget(BuildContext contexts) async {
    return await showDialog(
        context: contexts,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            title: const Text("Add New Task!"),
            content: TextField(
              onSubmitted: (value) {
                contexts.read<HomePageCubit>().changeName(value);
                box?.add(TasklyResponseModel(
                  content: value,
                  dateTime: DateTime.now().toString(),
                  status: false,
                ));
                Navigator.pop(contexts);
                setState(() {});
              },
            ),
          );
        });
  }
}
