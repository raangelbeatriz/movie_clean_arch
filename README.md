# Movie Clean Architecture

## ✨ About
Movie Clean Architecture is a project whose goal was to implement a screen with movie informations using Clean Architecture. To do this, I used The Movie DB API and based the design on the TodoMovies App. I had to make a few modifications to the layout because I couldn't find icons that match the ones in the inspiration app.

## ⚡ Demo
![Screen_Recording_20230319_140052_AdobeExpress](https://user-images.githubusercontent.com/50742224/226197692-6cfb32df-8cc3-4fa0-9533-8c84ba2eef33.gif)

## 📖 Main Technologies
- Flutter
- Provider and Change Notifier to manage state and do dependency injection
- Dio
- Custom Scroll View
- Mockito and Build Runner for testing

## ✏️ Tests
For testing, I used Mockito and Build Runner and developed tests on the domain layer, testing the Entity and use cases.

## 🚀 How to use
- Clone this project
```sh
git clone https://github.com/raangelbeatriz/movie_clean_arch
```
- Open the project and run
```sh
flutter pub get
```
- Generate an API key from The Movie DB API
- Go to the Keys file, in the path lib -> core -> utils -> keys.dart, and paste the key into the apiKey variable
- Run the project with the command
- Open the project and run
```sh
flutter run
```

## Similar App
I developed the MovieFlix app, which also uses The Movie DB API, and some time ago, I decided to refactor the project taking into account topics that I learned in the last few months. The project doesn't use Clean Architecture, but I developed a robust app that features a home screen, detail tiles, and a search feature that uses debounce. To check it out, click [HERE.](https://github.com/raangelbeatriz/movieflix)

   
   >This project was developed ❤️ by **[@Beatriz Rangel](https://www.linkedin.com/in/beatrizorangel/)**
   ---
