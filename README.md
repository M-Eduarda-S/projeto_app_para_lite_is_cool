# Projeto de um aplicativo para o projeto de extensão LITE IS COOL

### Disciplina:
Programação para Dispositivos Móveis

### Acadêmicos
- Beatriz Pimentel Bagesteiro Alves
- Juliana Bertolazi Simon
- Maria Eduarda Santos
- Nicolas Vera
- Yasmin Tarnovski Faccin


---
## Descrição do Projeto

Este repositório contém o desenvolvimento de um protótipo de aplicativo mobile voltado ao apoio do projeto de extensão "**Projeto Lite is Cool: introdução ao pensamento computacional e à cultura maker**", da UNIVALI.

O objetivo do aplicativo não é ser uma solução final funcional, mas sim apresentar uma **proposta de sistema que auxilie na organização das atividades do projeto**, servindo como validação de ideia junto aos responsáveis.

<br /> 

### Objetivo

Desenvolver um **protótipo** de aplicação que **ajude na organização e gerenciamento de informações do projeto**, como:
- Controle de presença dos alunos;
- Visualização de eventos e datas importantes;
- Simulação de geração de relatórios;
- Centralização de informações.
<br />

**Este projeto é um protótipo:**
- **Não** possui backend;
- **Não** está conectado a banco de dados;
- Os **dados** são simulados/localmente;
- Algumas funcionalidades são apenas **demonstrativas**.
<br />

---

### Funcionalidades (Protótipo)
- Tela inicial (Dashboard) com resumo de informações;
- Registro de presença de alunos;
- Visualização de calendário com eventos e datas;
- Tela de notificações;
- Configurações do aplicativo;
- Acesso simulado a relatórios (via redirecionamento externo).

**Observação sobre relatórios:** A funcionalidade de geração de relatórios não foi implementada neste protótipo. Como alternativa, foi utilizado um redirecionamento para uma pasta no Google Drive, simulando o acesso aos relatórios utilizados no projeto real.
<br />

---

## Tecnologias utilizadas
- **Flutter** (framework para desenvolvimento mobile);
- **Dart** (linguagem principal do aplicativo);
- **Android Studio** (ambiente de desenvolvimento).

**Observação:** Embora o repositório apresente outras linguagens como C++, CMake, Swift, HTML e C, essas fazem parte da estrutura interna do Flutter para suportar **múltiplas plataformas** (Android, iOS, Web e Desktop). Neste projeto, o desenvolvimento foi realizado **exclusivamente com Flutter e Dart**, sem necessidade de programar diretamente nessas outras linguagens.
  
<br />

### Requisitos para rodar o projeto
- Ter o Android Studio instalado.
<br />

### Como executar o projeto 
1. Clone o repositório;
2. Abra o projeto no Android Studio;
3. Execute os comandos:
```bash
flutter pub get
flutter run
```
4. Rode em um emulador ou dispositivo físico.
<br />

--- 

## Arquitetura

O projeto segue uma adaptação do padrão **MVVM (Model-View-ViewModel)**, utilizando também a camada de **Controller** para organização da lógica.

* **Model**: responsável pela estrutura dos dados (alunos, relatórios, notificações, etc.);
* **View**: responsável pela interface com o usuário (telas do aplicativo);
* **ViewModel**: camada responsável por intermediar a comunicação entre Model e View, organizando os dados e regras de exibição;
* **Controller**: utilizado para controlar a lógica da aplicação e gerenciar o estado das telas.

No projeto, os controllers desempenham um papel **semelhante** ao ViewModel, sendo responsáveis por manipular os dados, controlar as interações do usuário e organizar a lógica do protótipo. Embora a separação entre **ViewModel** e **Controller** exista conceitualmente, na prática essas responsabilidades foram concentradas nos controllers para **simplificar o desenvolvimento**, mantendo os princípios do padrão MVVM.

Essa **estrutura** facilita a organização, manutenção e possível evolução futura do projeto.

<br />

---
## Estrutura do projeto
```text
android/
assets/
ios/
lib/
	components/
		custom_header.dart 
	controllers/
		attendance_controller.dart
		calendar_controller.dart
		home_controller.dart
		notification_controller.dart
	models/
		event_model.dart
		notification_model.dart
		report_model.dart
		student_model.dart
		user_model.dart
	routes/
		app_routes.dart
	views/
		attendance_screen.dart
		calendar_screen.dart
		create_report_screen.dart
		home_screen.dart
		notification_screen.dart
		settings_screen.dart
	main.dart
linux/
macos/
test/
web/
windows/
.metadata
README.md
analysis_options.yaml
pubspec.lock
pubspec.yaml
```

<br />

**Observação:** Este projeto tem como foco a **prototipação de uma solução**, sendo desenvolvido para fins **acadêmicos** e sem fins lucrativos. O objetivo é demonstrar, de forma prática, como a tecnologia pode contribuir para a **organização** e **melhoria** do projeto de extensão Lite is Cool, **não representando um sistema final completo**.
