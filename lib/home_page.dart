import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:brocoscan/pest_info.dart';
import 'package:brocoscan/history_page.dart';

class HomePage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de Plagas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Control de Plagas',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/control.png'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  _identifyPest(context, pickedFile.path);
                }
              },
              child: Text('Tomar Foto'),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  _identifyPest(context, pickedFile.path);
                }
              },
              child: Text('Seleccionar de Galería'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
              child: Text('Historial'),
            ),
          ],
        ),
      ),
    );
  }

  void _identifyPest(BuildContext context, String filePath) {
    String pestName;
    String pestDescription;
    String pestControl;
    String pestImagePath;

    if (filePath.contains('plutella')) {
      pestName = 'Polilla de las Crucíferas (Plutella xylostella)';
      pestDescription = 'Descripción de la polilla de las crucíferas...';
      pestControl = 'Control de la polilla de las crucíferas...';
      pestImagePath = 'assets/images/plutella.png';
    } else if (filePath.contains('brevicoryne')) {
      pestName = 'Pulgón (Brevicoryne brassicae)';
      pestDescription = 'Descripción del pulgón...';
      pestControl = 'Control del pulgón...';
      pestImagePath = 'assets/images/brevicoryne.png';
    } else if (filePath.contains('hylemya')) {
      pestName = 'Mosca del repollo (Hylemya platura)';
      pestDescription = 'Descripción de la mosca del repollo...';
      pestControl = 'Control de la mosca del repollo...';
      pestImagePath = 'assets/images/hylemya.png';
    } else if (filePath.contains('agrotis')) {
      pestName = 'Gusano trozador (Agrotis ipsilon)';
      pestDescription = 'Descripción del gusano trozador...';
      pestControl = 'Control del gusano trozador...';
      pestImagePath = 'assets/images/agrotis.png';
    } else {
      pestName = 'Resultado Desconocido';
      pestDescription = 'No existe información';
      pestControl = '';
      pestImagePath = 'assets/images/unknown.png';
    }

    Provider.of<HistoryModel>(context, listen: false).addRecord(pestName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PestInfo(
          title: pestName,
          description: pestDescription,
          control: pestControl,
          imagePath: pestImagePath,
        ),
      ),
    );
  }
}
