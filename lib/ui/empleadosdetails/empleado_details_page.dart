import 'package:control_empleados/ui/empleados/empleado.dart';
import 'package:control_empleados/ui/empleadosdetails/empleado_detail_body.dart';
import 'package:control_empleados/ui/empleadosdetails/footer/empleado_detail_footer.dart';
import 'package:control_empleados/ui/empleadosdetails/header/empleado_detail_header.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class EmpleadoDetailsPage extends StatefulWidget {
  EmpleadoDetailsPage(
    this.empleado, {
    @required this.avatarTag,
  });

  final Empleado empleado;
  final Object avatarTag;

  @override
  _EmpleadoDetailsPageState createState() => new _EmpleadoDetailsPageState();
}

class _EmpleadoDetailsPageState extends State<EmpleadoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = const BoxDecoration(
      gradient: const LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          const Color(0xFF413070),
          const Color(0xFF2B264A),
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new EmpleadoDetailHeader(
                widget.empleado,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new EmpleadoDetailBody(widget.empleado),
              ),
              new EmpleadoShowcase(widget.empleado),
            ],
          ),
        ),
      ),
    );
  }
}
