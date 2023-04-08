import 'package:http/http.dart' as http;

fetchdata(String apiCall_url) async {
  try {
    http.Response response = await http.get(Uri.parse(apiCall_url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*",
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
