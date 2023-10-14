import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Splitter',
      home: GroupListScreen(),
    );
  }
}

class GroupListScreen extends StatelessWidget {
  final List<String> groups = [
    'Group 1',
    'Group 2',
    'Group 3'
  ]; // Replace with your own group data.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Groups'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(groups[index]),
                  onTap: () {
                    // Navigate to the group's expense page when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GroupExpenseScreen(groupName: groups[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to the screen to create a new group.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewGroupScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
            label: Text('Start a New Group'),
          ),
        ],
      ),
    );
  }
}

class GroupExpenseScreen extends StatelessWidget {
  final String groupName;

  GroupExpenseScreen({required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      // Here you can add widgets to display and manage expenses for the selected group.
      body: Center(
        child: Text('Expenses for $groupName will be displayed here.'),
      ),
    );
  }
}

class NewGroupScreen extends StatefulWidget {
  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a New Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(labelText: 'Group Name'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Create the new group with the entered group name.
                String newGroupName = _groupNameController.text;
                // You can add logic here to create the new group.
                Navigator.pop(context);
              },
              child: Text('Create Group'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }
}
