import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/home_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const Color bgColor = Color(0xFF1A1A2E);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    final user = controller.user;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // botão de voltar, ele leva para a tela que estava antes
              Transform.translate(
                offset: const Offset(-12, 0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Configurações',
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2E2E5D),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: SvgPicture.asset(
                              'assets/icons/user_icon.svg',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 18,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // nome do usuário está fixo
                    Text(
                      'Juliana Bertolazi Simon',
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.role,
                      style: GoogleFonts.arimo(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              _SettingsOption(
                title: 'Adicionar novo usuário',
                subtitle: 'Clique aqui para cadastrar um novo usuário no sistema.',
                onTap: () {}, // funcionalide não implementada, já que é só um protótipo
              ),
              const SizedBox(height: 32),
              _SettingsToggleOption(
                title: 'Trocar o tema',
                onChanged: (val) {}, // funcionalide também não implementada
              ),
              const SizedBox(height: 32),
              _SettingsOption(
                title: 'Iniciar novo semestre',
                subtitle: 'Semestre atual: 2026/1',
                onTap: () {}, // funcionalide também não implementada
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reutilizável para o texto e subtítulo
class _SettingsOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsOption({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.arimo(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget com estado para toggle tema claro e escuro (não foi implementado o tema claro)
class _SettingsToggleOption extends StatefulWidget {
  final String title;
  final ValueChanged<bool> onChanged;

  const _SettingsToggleOption({
    required this.title,
    required this.onChanged,
  });

  @override
  State<_SettingsToggleOption> createState() => _SettingsToggleOptionState();
}

class _SettingsToggleOptionState extends State<_SettingsToggleOption> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _value = !_value;
            });
            widget.onChanged(_value);
          },
          child: Container(
            width: 60,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF2E2E5D),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                // icone muda conforme o estado fica lua ou sol
                child: Icon(
                  _value ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                  size: 16,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
