import 'package:fair_and_square/group_service.dart';
import 'package:fair_n_square/fairnsquare/transactions/v1alpha1/group.pb.dart';
import 'package:flutter/material.dart';

void main() {
  ListGroupsAPI().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GroupsList(),
    );
  }
}

class GroupsList extends StatefulWidget {

  const GroupsList({super.key});

  @override 
  State<GroupsList> createState() => _GroupsListState();
  
}

class _GroupsListState extends State<GroupsList> {

  List<Group> groups = [];

  @override
  void initState () {
    super.initState();
    _fetchGroupsList();    
  }

  void _fetchGroupsList() async {
    var response = await ListGroupsAPI.instance.groupServiceClient.listGroups(ListGroupsRequest());
    setState(() {
        groups = response.groups;
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fair_n_Square"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(groups[index].id),
              subtitle: Text(groups[index].name),
            );
          }
          ),
      ),
    );
  }
  
}

 