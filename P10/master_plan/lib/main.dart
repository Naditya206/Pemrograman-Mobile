import 'package:flutter/material.dart';
import 'models/data_layer.dart';
import 'provider/plan_provider.dart';
import 'views/plan_creator_screen.dart';

void main() {
  runApp(const MasterPlansApp());
}

class MasterPlansApp extends StatelessWidget {
  const MasterPlansApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>([
        const Plan(name: 'Try to take over the world', tasks: [
          Task(description: 'Plan step 1', complete: true),
          Task(description: 'Plan step 2', complete: false),
          Task(description: 'Plan step 3', complete: false),
        ]),
        const Plan(name: 'Invent New Form of Cheese', tasks: [
          Task(description: 'Experiment 1', complete: false),
          Task(description: 'Experiment 2', complete: false),
          Task(description: 'Experiment 3', complete: false),
          Task(description: 'Experiment 4', complete: false),
          Task(description: 'Experiment 5', complete: false),
          Task(description: 'Experiment 6', complete: false),
          Task(description: 'Experiment 7', complete: false),
          Task(description: 'Experiment 8', complete: false),
          Task(description: 'Experiment 9', complete: false),
          Task(description: 'Experiment 10', complete: false),
          Task(description: 'Experiment 11', complete: false),
          Task(description: 'Experiment 12', complete: false),
          Task(description: 'Experiment 13', complete: false),
          Task(description: 'Experiment 14', complete: false),
        ]),
        const Plan(name: 'Learn Flutter', tasks: [
          Task(description: 'Read docs', complete: true),
          Task(description: 'Install Flutter', complete: true),
          Task(description: 'Create project', complete: true),
          Task(description: 'Make UI', complete: true),
          Task(description: 'State management', complete: true),
          Task(description: 'Testing', complete: true),
          Task(description: 'Deploy', complete: false),
          Task(description: 'Refactor', complete: false),
          Task(description: 'Publish', complete: false),
          Task(description: 'Docs', complete: false),
          Task(description: 'Widgets', complete: false),
          Task(description: 'Animation', complete: false),
          Task(description: 'Network', complete: false),
          Task(description: 'Finishing', complete: false),
        ]),
      ]),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Master Plans',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}