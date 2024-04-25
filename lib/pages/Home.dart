import 'package:flutter/material.dart';
import 'package:manager/abas/Vencimentos.dart';
import 'package:manager/abas/debitos.dart';

import '../abas/ganhos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Sua atividade finaceira'),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.close))
        ],
        bottom: TabBar(

          controller: _tabController,
          tabs: const [
            Tab(text: 'Ganhos',icon: Icon(Icons.monetization_on),),
            Tab(text: 'Debito',icon: Icon(Icons.device_thermostat_rounded)),
            Tab(text: 'Vencimento',icon: Icon(Icons.date_range)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Ganhos(),
          Debitos(),
          Vencimentos(),
        ],
      ),
    );
  }
}
