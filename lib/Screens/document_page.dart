import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kconnect/Widgets/pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';

class DocumentPage extends StatelessWidget {
  final List<Document> documents = [
    Document(
      name: 'Holiday Schedule 2025',
      type: 'PDF',
      url: 'https://example.com/holiday_schedule.pdf',
    ),
    Document(
      name: 'Exam Notice Jan 2025',
      type: 'PDF',
      url: 'https://example.com/exam_notice.pdf',
    ),
    Document(
      name: 'Emergency Guidelines',
      type: 'PDF',
      url: 'https://example.com/emergency_guidelines.pdf',
    ),
  ];

  void _viewDocument(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(url: url),
      ),
    );
  }

  Future<void> _downloadDocument(BuildContext context, String url) async {
    try {
      final dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/${url.split('/').last}';
      await dio.download(url, filePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Documents'),
      ),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading:
                    Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
                title: Text(document.name),
                subtitle: Text('Type: ${document.type}'),
                trailing: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _viewDocument(context, document.url),
                        child: Text('View'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () =>
                            _downloadDocument(context, document.url),
                        child: Text('Download'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Document {
  final String name;
  final String type;
  final String url;

  Document({
    required this.name,
    required this.type,
    required this.url,
  });
}
