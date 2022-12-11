import 'package:bloc_connectivity/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_connectivity/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: BlocConsumer<InternetBloc, InetrnetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Internet Connected Successfully",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Internet Lost........",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }
        },
        builder: ((context, state) {
          return BlocBuilder<InternetBloc, InetrnetState>(
              builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Internet Conneted....");
            } else if (state is InternetLostState) {
              return const Text("Internet No Connected....");
            } else {
              return const Text("Loading....");
            }
          });
        }),
      ))),
    );
  }
}
//  BlocBuilder<InternetBloc, InetrnetState>(builder: (context, state) {
//           if (state is InternetGainedState) {
//             return const Text("Internet Conneted....");
//           } else if (state is InternetLostState) {
//             return const Text("Internet No Connected....");
//           } else {
//             return const Text("Loading....");
//           }
//         }),
