# TeldaMovie

## Project Overview
TeldaTask movie app is a native iOS application designed to provide a seamless movie browsing experience. The app follows the MVVM (Model-View-ViewModel) architecture pattern integrated with Clean Architecture principles. The entire project is developed using native Swift, leveraging Combine for reactive programming and URLSession for network communication. No third-party libraries are used in this project, ensuring that it is lightweight and highly maintainable.

## Project Structure
The project is structured into various folders, each serving a specific purpose and adhering to the principles of Clean Architecture. Here is an overview of the project's file structure and their roles:

### Common Layer
- **Constants**: Contains application-wide constant values.
- **APIKeyManager**: Contains api key from secret config file

- **UICollectionView+**: Extensions for `UICollectionView`.
- **UIImageView+**: Extensions for `UIImageView`.
- **UIView+**: Extensions for `UIView`.

### Application
- **LaunchScreen**: Configuration and design for the app's launch screen.
- **AppDelegate**: The app's delegate, handling application lifecycle events.
- **SceneDelegate**: The scene delegate, handling scene-specific events.

- **UserDefaultsManager**: Manager for handling data storage in UserDefaults.

### Data
- **Networking**: Contains classes related to network communication using URLSession.
- **RepoImplementation**: Implementation of repository patterns, providing data from different sources.

### Domain
- **Entities**: Core entities used throughout the app.
  - **Model**:
    - **MovieDetails**: Models related to movie details.
    - **MovieList**: Models related to movie listings.
    - 
- **RepositoryInterface**: Protocols defining repository interfaces.
  - **MoviesListRepoProtocol**: Protocol for movie list repository.
  - **MovieDetailsRepoProtocol**: Protocol for movie details repository.

### UseCases

- **MoviesList**: Use cases related to movie listings and search query

### Presentation
- **Scenes**: Contains different scenes or modules of the app.
  - **MovieDetails**:
    - **View**: Views related to the MovieDetails scene.
    - **ViewModel**: ViewModels for the MovieDetails scene.
      
  - **MoviesList**:
    - **View**: Views related to the MoviesList scene.
    - **ViewModel**: ViewModels for the MoviesList scene.

### App Assets
Contains assets used in the application such as images, videos, etc.

## Architecture
### MVVM (Model-View-ViewModel) with Clean Architecture
The project follows the MVVM architecture pattern integrated with Clean Architecture principles. This ensures a clear separation of concerns, making the codebase more modular, testable, and maintainable.

- **Model**: Represents the data and business logic of the application. Models are plain Swift structs or classes.
- **View**: The UI layer, which is composed of UIKit components such as `UIViewController`, `UICollectionView`, etc.
- **ViewModel**: Acts as a mediator between the View and the Model. It handles the presentation logic and uses Combine for reactive programming.

### Networking with URLSession
All network communication is handled using URLSession. This ensures a robust and native approach to making network requests without relying on any third-party libraries.

## Combine for Reactive Programming
Combine is used for handling asynchronous events and reactive programming throughout the app. This allows for a more declarative approach to handling data streams and ensures a smooth and responsive user experience.

## UserDefaults for Persistent Storage
UserDefaults is used for lightweight data storage, such as saving user preferences and app settings. The `UserDefaultsManager` class provides a clean and easy-to-use interface for interacting with UserDefaults.
