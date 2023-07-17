import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.adviceList.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.adviceList.length) {
                    if (!state.isAdviceLoading) {
                      BlocProvider.of<HomeBloc>(context).add(AddAdviceInList());
                    }

                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  } else {
                    return Center(child: Text(state.adviceList[index].text));
                  }
                });
          } else {
            BlocProvider.of<HomeBloc>(context).add(AddAdviceInList());
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
        },
      ),
    );
  }
}
