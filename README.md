# Projeto desenvolvimento de um app para o porjeto de extensão LITE IS COOL

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

Aplicativo Android que simula uma calculadora básica com operações de:
- Soma

<br /> <br /> 


### Funcionalidades
- Tela de Login com validação
- Exibição de diálogo de erro para credenciais inválidas
- Tela de calculadora com operações básicas
- Botões habilitados/desabilitados conforme entrada
- Compartilhamento de resultado via Intent implícita
<br />

## Tecnologias utilizadas
- Android Studio
- Linguagem de programação Flutter
<br />

### Requisitos para rodar o projeto
- Ter o Android Studio instalado
<br />

### Como rodar o projeto
1. Clone o repositório
2. Abra no Android Studio
3. Execute em um emulador ou dispositivo físico
<br />

## Fluxo do Aplicativo
1. Usuário insere CPF e senha
2. Se válido → vai para calculadora
3. Se inválido → exibe diálogo de erro
4. Realiza cálculo
5. Pode compartilhar o resultado
<br />

---
## Arquitetura

O projeto segue o padrão de arquitetura MVVM (Model-View-ViewModel), amplamente utilizado no desenvolvimento Android com Kotlin, que separa as responsabilidades da aplicação em:

- Model: responsável pela lógica de negócio (ex: operações da calculadora)
- View: responsável pela interface com o usuário (Activities, Dialogs)
- ViewModel: responsável por intermediar a comunicação entre Model e View, mantendo os dados e regras de UI

Essa abordagem facilita a organização, manutenção e escalabilidade do código.
<br />

---
## Estrutura do projeto

```text
app/
	src/
		main/
			java/com/example/calculadoracomloginapp/
		    	model/
                    Calculadora.kt
                view/
                    MainActivity.kt
                    CalculadoraActivity.kt
                    DialogoErro.kt
                viewmodel/
                    CalculadoraViewModel.kt
			res/
				drawable/
				layout/
				    activity_calculadora.xml
					activity_login.xml
					dialogo_erro.xml
				mipmap/
				values/
			AndroidManifest.xml
.gitignore
README.md
```
