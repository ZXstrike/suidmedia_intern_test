import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suidmedia_intern_test/viewmodel/third_screen_viewmodel.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late final ThirdScreenViewModel pageProvider;

  @override
  void initState() {
    super.initState();

    pageProvider = Provider.of<ThirdScreenViewModel>(context, listen: false);
    pageProvider.context = context;
    pageProvider.getUserData();
    pageProvider.scrollController.addListener(pageProvider.onScroll);
  }

  @override
  void dispose() {
    super.dispose();

    pageProvider.userList.clear();
    pageProvider.page = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blueAccent,
          ),
        ),
        title: const Text(
          'Third Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => pageProvider.onRefresh(),
        child: Consumer<ThirdScreenViewModel>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              controller: pageProvider.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: value.userList.length,
              itemBuilder: (context, index) {
                final user = value.userList[index];
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 226, 227, 228),
                        offset: Offset(0, -0.5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    onTap: () => pageProvider.selectUser(user),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                      radius: 50,
                    ),
                    title: Text(
                      '${user.firstName} ${user.lastName}',
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(user.email),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
