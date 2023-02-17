import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager_example/cubit/get_lat_long_qubit/get_lat_long_cubit.dart';
import 'package:workmanager_example/cubit/get_lat_long_qubit/get_lat_long_state.dart';
import 'package:workmanager_example/utils/time_utils.dart';

class LatLongPage extends StatelessWidget {
  const LatLongPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Workmanager',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: BlocBuilder<GetLatLongCubit, GetLatLongState>(
        builder: (context, state) {
          if (state is GetLatLongInLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetLatLongInSuccess) {
            return ListView(
              children: List.generate(
                state.cachedLatLong.length,
                (index) {
                  var item = state.cachedLatLong[index];
                  return ListTile(
                    onTap: () {},
                    title: Text(
                      TimeUtils.formatToMyTime(
                        DateTime.parse(item.dateTime),
                      ),
                    ),
                    subtitle: Text('${item.lat}\n${item.long}'),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
