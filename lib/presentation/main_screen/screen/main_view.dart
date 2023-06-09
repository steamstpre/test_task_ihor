import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_3/model/movie_result.dart';
import 'package:test_3/presentation/main_screen/bloc/main_screen_bloc.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        if (state is LoadedDataState) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    MovieResult item = state.results[index];
                    Navigator.of(context)
                        .pushNamed('/detail_screen', arguments: item);
                  },
                );
              });
        }
        if (state is LoadedFavoriteState) {
          return ListView.builder(
              itemCount: state.favoriteMovies.length,
              itemBuilder: (context, index) {
                final item = state.favoriteMovies[index];
                return ListTile(
                  title: Text(item.title),
                  onTap: () {
                    MovieResult item = state.favoriteMovies[index];
                    Navigator.of(context)
                        .pushNamed('/detail_screen', arguments: item);
                  },
                );
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
