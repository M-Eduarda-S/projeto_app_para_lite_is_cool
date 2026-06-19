import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/attendance_controller.dart';
import '../models/student_model.dart';
import '../routes/app_routes.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final controller = AttendanceController();
  late List<bool> draftPresence;

  static const Color bgColor = Color(0xFF1A1A2E);
  static const Color cardDark = Color(0xFF252542);
  static const Color accentPurple = Color(0xFF7B5EA7);

  @override
  void initState() {
    super.initState();
    // Create a local copy of the presence status
    draftPresence = controller.students.map((s) => s.isPresent).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: _BottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(controller: controller),
                  const SizedBox(height: 12),
                  _DateChip(date: controller.formattedToday),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.students.length,
                itemBuilder: (context, index) {
                  final student = controller.students[index];
                  return Column(
                    children: [
                      _StudentTile(
                        student: student,
                        isPresent: draftPresence[index], // Use the local draft
                        onToggle: () {
                          setState(() {
                            draftPresence[index] = !draftPresence[index];
                          });
                        },
                        onLongPress: () => _showDeleteConfirmation(context, student, index),
                      ),
                      if (index < controller.students.length - 1)
                        const Divider(color: Colors.white10, height: 1),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _AddStudentButton(onTap: () => _showAddStudentDialog(context)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: _ConfirmButton(onTap: () {
                      // Apply changes to the main controller only when confirming
                      for (int i = 0; i < controller.students.length; i++) {
                        controller.students[i].isPresent = draftPresence[i];
                      }
                      Navigator.pop(context);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddStudentDialog(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardDark,
        title: const Text('Adicionar Novo Aluno', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Nome do Aluno',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Idade',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: accentPurple),
            onPressed: () {
              if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
                setState(() {
                  controller.addStudent(
                    nameController.text,
                    int.tryParse(ageController.text) ?? 0,
                  );
                  // Update draft list to match new student
                  draftPresence.add(false);
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Adicionar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, StudentModel student, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardDark,
        title: const Text('Excluir Aluno', style: TextStyle(color: Colors.white)),
        content: Text(
          'Tem certeza que deseja remover ${student.name} da lista?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              setState(() {
                controller.deleteStudent(student.id);
                draftPresence.removeAt(index); // Update draft list
              });
              Navigator.pop(context);
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.controller});
  final AttendanceController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Lista de Presença',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  controller.user.name,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                Text(
                  controller.user.role,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF3D3D6B),
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/user_icon.svg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DateChip extends StatelessWidget {
  const _DateChip({required this.date});
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF7B5EA7), Color(0xFF1DB954)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_month, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _StudentTile extends StatelessWidget {
  const _StudentTile({
    required this.student,
    required this.isPresent,
    required this.onToggle,
    required this.onLongPress,
  });
  final StudentModel student;
  final bool isPresent;
  final VoidCallback onToggle;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: SvgPicture.asset(
                student.iconPath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${student.age} anos',
                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onToggle,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isPresent ? Colors.transparent : Colors.white24,
                    width: 2,
                  ),
                  color: isPresent ? Colors.white : Colors.white12,
                ),
                child: isPresent
                    ? const Icon(Icons.check, color: Color(0xFF1A1A2E), size: 20)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddStudentButton extends StatelessWidget {
  const _AddStudentButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF252542),
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: const Text(
          '+ Adicionar novo aluno',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7B5EA7), Color(0xFF1DB954)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Confirmar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF13132A),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.dashboard, color: Colors.white54, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const Icon(Icons.group, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined,
                color: Colors.white54, size: 28),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.calendar),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Colors.white54, size: 28),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
          ),
        ],
      ),
    );
  }
}
