import 'package:flutter/material.dart';
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
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Configurações',
                style: TextStyle(
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
                          child: const Icon(
                            Icons.face, // Using Icons.face as a placeholder for the doodle
                            size: 90,
                            color: Colors.white,
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
                    const Text(
                      'Juliana Bertolazi Simon', // Using name from image
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Bolsista',
                      style: TextStyle(
                        color: Colors.white70,
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
                onTap: () {},
              ),
              const SizedBox(height: 32),
              _SettingsToggleOption(
                title: 'Trocar o tema',
                onChanged: (val) {},
              ),
              const SizedBox(height: 32),
              _SettingsOption(
                title: 'Iniciar novo semestre',
                subtitle: 'Semestre atual: 2026/1',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

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
          style: const TextStyle(
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
