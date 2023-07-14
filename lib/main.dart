import 'package:flutter/material.dart';

import 'package:my_message/dra.dart';

main() => runApp(My_message());

class My_message extends StatelessWidget {
  const My_message({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Message ',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Chat(),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: dra(),
      appBar: AppBar(
        title: Text('Message'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.account_circle),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text(
                "Choose a Account",
                style: TextStyle(fontSize: 12),
              )),
              PopupMenuItem(child: Text("Sign Your Account")),
            ],
          ),
        ],
        elevation: 5,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                MessageBubble(sender: 'John', text: 'Hi'),
                MessageBubble(sender: 'Kohn', text: 'Sorry'),
                MessageBubble(sender: 'Sohn', text: 'call me'),
                MessageBubble(sender: 'Mohn', text: 'how are you'),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Type a Message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  const MessageBubble({required this.sender, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Jako',
    'John',
    'Moip',
    'Mohn',
    'kohn',
    'Wohn',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  // ignore: override_on_non_overriding_member

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in searchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
