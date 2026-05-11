Future<String> fetchData() async {
  // Simulating 3-second delay
  await Future.delayed(Duration(seconds: 3));

  // Simulated error
  throw Exception("Connection Timeout");

  // Success response (won't execute because of error)
  // return "Data fetched successfully!";
}

void main() async {
  print("Fetching data from mock database...");

  try {
    String data = await fetchData();
    print(data);
  } catch (e) {
    print("Error: $e");
  }

  print("Program completed.");
}