import 'package:bloc_connectivity/cubit/internet_cubit.dart';
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
              child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Internet Connected Successfully",
              ),
              backgroundColor: Colors.green,
            ));
          } else if (state == InternetState.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Internet Lost........",
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: ((context, state) {
          return BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
            if (state == InternetState.Gained) {
              return const Text("Internet Conneted....");
            } else if (state == InternetState.Lost) {
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
