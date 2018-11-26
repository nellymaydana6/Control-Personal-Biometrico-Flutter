import 'dart:async';

import 'package:control_empleados/ui/empleados/empleado.dart';
import 'package:control_empleados/ui/empleadosdetails/empleado_details_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmpleadosListPage extends StatefulWidget {
  @override
  _EmpleadosListPageState createState() => new _EmpleadosListPageState();
}

class _EmpleadosListPageState extends State<EmpleadosListPage> {
  List<Empleado> _empleados = [];

  @override
  void initState() {
    super.initState();
    _loadEmpleados();
  }

  Future<void> _loadEmpleados() async {
    http.Response response =
        await http.get('https://randomuser.me/api/?results=25');

    setState(() {
      _empleados = Empleado.allFromResponse(response.body);
    });
  }

  Widget _buildEmpleadosListTile(BuildContext context, int index) {
    var friend = _empleados[index];

    return new ListTile(
      onTap: () => _navigateToFriendDetails(friend, index),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

  void _navigateToFriendDetails(Empleado empleado, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new EmpleadoDetailsPage(empleado, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_empleados.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _empleados.length,
        itemBuilder: _buildEmpleadosListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Empleados')),
      body: content,
    );
  }
}
