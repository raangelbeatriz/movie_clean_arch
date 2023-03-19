# Movie Clean Architecture
## ✨ Sobre

Movie Clean Architecture é um projeto cujo objetivo era implementar uma telha com informações de filmes utilizando a Arquitetura Limpa. Para isso utilizei a api do The Movie DB e me basei no design do aplicativo TodoMovies. Precisei realizar algumas pequenas modificações no layout pois não encontrei ícones completamente iguais aos propostos no modelo. 

## ⚡ Demo
![Screen_Recording_20230319_140052_AdobeExpress](https://user-images.githubusercontent.com/50742224/226197692-6cfb32df-8cc3-4fa0-9533-8c84ba2eef33.gif)


## 📖 O que utilizei
- Flutter
- Provider e Change Notifier para gerenciar estado e fazer injeção de dependência
- Dio
- Custom Scroll View
- Mockito e Build Runner para testes

## ✏️ Testes 
Para realização dos testes utilizei o Mockito e o Build Runner e desenvolvi testes em cima da camada de domínio testando a Entity e os use cases.

## 🚀 Como usar

- Clone esse projeto
```sh
git clone https://github.com/raangelbeatriz/movie_clean_arch
```
- Abra o projeto e de um nos packages
```sh
flutter pub get
```
- Gere um chave na API do The Movies DB
- Vá até o arquivo de Keys, no caminho lib -> core -> utils -> keys.dart e cole a chave na variável apiKey
- Rode o projeto com o comando
```sh
flutter run
```

## Aplicativo Similar

Desenvolvi o aplicativo MovieFlix, que também faz uso da API do The Movie DB e a algum tempo atrás resolvi refatorar o projeto levando em consideração tópicos que aprendi nesses últimos meses. O projeto não utiliza a Clean Arch mas nele desenvolvi um aplicativo um pouco mais robusto que conta com a tela inicial, telha de detalhes e busca, que utiliza do debounce. Para checar clique [AQUI.](https://github.com/raangelbeatriz/movieflix)
   
   >This project was developed ❤️ by **[@Beatriz Rangel](https://www.linkedin.com/in/beatrizorangel/)**
   ---
