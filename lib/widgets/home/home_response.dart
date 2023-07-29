import 'package:flutter/material.dart';

class HomeResponsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    final String responseText = arguments is String ? arguments : '';
    final List<dynamic> responseList =
        arguments is List<dynamic> ? arguments : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Response'),
      ),
      body: responseList.isNotEmpty
          ? ListView.builder(
              itemCount: responseList.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Label',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Confidence',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              responseList[0]['className'],
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${(responseList[0]['probability'] * 100).toStringAsFixed(2)}%',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                final Map<String, dynamic> item = responseList[index];
                final String label = item['className'];
                final double confidence = item['probability'];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${(confidence * 100).toStringAsFixed(2)}%',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text(
                responseText,
                style: const TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
