import 'package:flutter/material.dart';
import 'package:lojinha/src/pages/common_widgets/custom_text_field.dart';
import 'package:lojinha/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSawtchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text("Cadastro",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
      
                  //Formulario de cadastro
      
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                          icon: Icons.email,
                          label: "E-mail",
                        ),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isSecret: true,
                        ),
                        const CustomTextField(
                          icon: Icons.person,
                          label: "Nome",
                        ),
                         CustomTextField(
                          icon: Icons.phone,
                          label: "Celular",
                          inputFormatters: [phoneFormatter],
                        ),
                         CustomTextField(
                          icon: Icons.file_copy,
                          label: "CPF",
                          inputFormatters: [cpfFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Cadastrar Usuário",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
           
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
