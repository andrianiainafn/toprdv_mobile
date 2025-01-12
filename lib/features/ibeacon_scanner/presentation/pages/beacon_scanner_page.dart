import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/beacon_scanner_bloc.dart';

@RoutePage()
class BeaconScannerPage extends StatelessWidget {
  const BeaconScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final beaconBloc = context.read<BeaconScannerBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<BeaconScannerBloc, BeaconScannerState>(
        builder: (context, state) {
          if (state is BeaconScannerInitial) {
            return Center(
              child: Text('Scanning is not active'),
            );
          } else if (state is BeaconScannerScanning) {
            return ListView.builder(
              itemCount: state.beacons.length,
              itemBuilder: (context, index) {
                final beacon = state.beacons[index];
                return ListTile(
                  title: Text('UUID: ${beacon.proximityUUID}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Major: ${beacon.major}, Minor: ${beacon.minor}'),
                      Text(
                          'Distance: ${beacon.accuracy.toStringAsFixed(2)}m'),
                      Text('RSSI: ${beacon.rssi}'),
                    ],
                  ),
                );
              },
            );
          } else if (state is BeaconError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: BlocBuilder<BeaconScannerBloc, BeaconScannerState>(
        builder: (context, state) {
          final isScanning = state is! BeaconScannerInitial;
          return FloatingActionButton(
            onPressed: () {
              if (isScanning) {
                beaconBloc.add(StopScanningEvent());
              } else {
                beaconBloc.add(StartScanningEvent());
              }
            },
            tooltip: isScanning ? 'Stop Scanning' : 'Start Scanning',
            child: Icon(isScanning ? Icons.stop : Icons.play_arrow),
          );
        },
      ),
    );
  }
}


