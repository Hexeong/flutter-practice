import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

writeLetter(var emotion, var cause, var today, Function saveMessage) async {
  String apiKey1 = "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";
  String apiKey2 = "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";

  String AssistantID1 = "asst_3q5gL3qutSIG6J14VsAj38Qt";
  String AssistantID2 = "asst_UHd43h5CQH2IlzviKnNMkvq9";

  final pref = await SharedPreferences.getInstance();
  var age = 24; //  pref.getString("userName")
  var job = "학생"; // pref.getString("userJob")

  String input = "나이는 $age이고, 직업은 $job이야. 내가 느낀 감정은 [$emotion]이고, 원인은 $cause 때문이야. $today";

  Dio _dio1 = Dio(BaseOptions(
      headers: {
        'Authorization' : 'Bearer $apiKey2',
        'Content-Type' : 'application/json',
        'OpenAI-Beta' : 'assistants=v1'
      }
  ));

  Dio _dio2 = Dio(BaseOptions(
      headers: {
        'Authorization' : 'Bearer $apiKey2',
        'OpenAI-Beta' : 'assistants=v1'
      }
  ));

  // create threads : 완료
  var res1 = await _dio1.post("https://api.openai.com/v1/threads");
  Map<String, dynamic> ThreadRes = res1.data;
  var thread_id = ThreadRes["id"];
  print(ThreadRes);

  // create message
  var res2 = await _dio1.post("https://api.openai.com/v1/threads/$thread_id/messages", data: {
    "role" : "user",
    "content" : input
  });
  Map<String, dynamic> MessageRes = res2.data;
  print(MessageRes);

  // create runs
  var res3 = await _dio1.post("https://api.openai.com/v1/threads/$thread_id/runs", data: {
    'assistant_id' : AssistantID2
  });
  Map<String, dynamic> RunRes = res3.data;
  var run_id = RunRes["id"];
  print(RunRes);

  // retrieve run
  var res4 = await _dio2.get("https://api.openai.com/v1/threads/$thread_id/runs/$run_id");
  Map<String, dynamic> RetRunRes = res4.data;
  while(RetRunRes["status"] != "completed") {
    print("not completed");
    await Future.delayed(Duration(seconds: 30));
    res4 = await _dio2.get("https://api.openai.com/v1/threads/$thread_id/runs/$run_id");
    RetRunRes = res4.data;
  }

  // search GPT res
  var res5 = await _dio1.get("https://api.openai.com/v1/threads/$thread_id/messages");
  Map<String, dynamic> ListMessageData = res5.data;
  String GPTmessage = ListMessageData["data"][0]["content"][0]["text"]["value"];
  print(GPTmessage);

  await saveMessage(GPTmessage);
}