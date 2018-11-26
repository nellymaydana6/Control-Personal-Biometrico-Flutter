import 'package:control_empleados/ui/empleados/empleado.dart';
import 'package:control_empleados/ui/empleadosdetails/footer/articles_showcase.dart';
import 'package:control_empleados/ui/empleadosdetails/footer/portfolio_showcase.dart';
import 'package:control_empleados/ui/empleadosdetails/footer/skills_showcase.dart';

import 'package:flutter/material.dart';

class EmpleadoShowcase extends StatefulWidget {
  EmpleadoShowcase(this.empleado);

  final Empleado empleado;

  @override
  _EmpleadoShowcaseState createState() => new _EmpleadoShowcaseState();
}

class _EmpleadoShowcaseState extends State<EmpleadoShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      //new Tab(text: 'Portfolio'),
      new Tab(text: 'Skills'),
      new Tab(text: 'Jobies'),
    ];
    _pages = [
      new PortfolioShowcase(),
      //new SkillsShowcase(),
      new ArticlesShowcase(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
