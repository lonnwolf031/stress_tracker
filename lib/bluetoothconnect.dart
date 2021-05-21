

FlutterBlue flutterBlue = FlutterBlue.instance;

// Start scanning
flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
var subscription = flutterBlue.scanResults.listen((results) {
  // do something with scan results
  for (ScanResult r in results) {
    print('${r.device.name} found! rssi: ${r.rssi}');
  }
});

// Stop scanning
flutterBlue.stopScan();

// Connect to the device
await device.connect();

// Disconnect from device
device.disconnect();

// discover services
List<BluetoothService> services = await device.discoverServices();
services.forEach((service) {
// do something with service
});

// Reads all characteristics
var characteristics = service.characteristics;
for(BluetoothCharacteristic c in characteristics) {
List<int> value = await c.read();
print(value);
}

// Writes to a characteristic
await c.write([0x12, 0x34])

// Reads all descriptors
var descriptors = characteristic.descriptors;
for(BluetoothDescriptor d in descriptors) {
List<int> value = await d.read();
print(value);
}

// Writes to a descriptor
await d.write([0x12, 0x34])

await characteristic.setNotifyValue(true);
characteristic.value.listen((value) {
// do something with new value
});

final mtu = await device.mtu.first;
await device.requestMtu(512);