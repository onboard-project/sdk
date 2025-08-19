# 📦 Onboard SDK

>[!Note]
> **EDUCATIONAL PROJECT DISCLAIMER**
>
>This project is developed purely for **educational and demonstrative purposes**. While it aims to provide useful public transport information for Milan, it relies on data sources, including scraping information from `giromilano.atm.it`.
>
>**The terms of service for ATM (Azienda Trasporti Milanesi) regarding data usage are not explicitly clear, and this project may potentially violate them.**
>
>Therefore:
>- **Use at Your Own Risk:** We do not guarantee the accuracy or continued availability of the data, nor do we assume responsibility for any consequences arising from its use.
>- **Unscheduled Discontinuation:** This project, or parts of it, may be taken down or become non-functional unexpectedly if ATM's policies change or if the data sources become inaccessible.
>
>We advise caution and understanding of these limitations.

The **Onboard SDK** is a Dart package designed to facilitate seamless interaction with the [Onboard Project server](https://github.com/onboard-project/server) API. It provides a set of data models (Dart classes) and helper methods to consume the server's JSON responses, making it easy for the [Onboard Client](https://github.com/onboard-project/client) (or any other Dart application) to work with public transport data.

## ✨ Key Features

*   **Type-Safe Data Models:** Converts raw JSON data from the server into strongly-typed Dart objects (e.g., `Stop`, `Line`, `WaitingTime`).
*   **Easy API Interaction:** Provides convenient methods to fetch data from various Onboard server endpoints.
*   **Reduced Boilerplate:** Abstracts away JSON parsing and HTTP request handling, allowing developers to focus on application logic.
*   **Testable & Maintainable:** Designed with best practices to ensure code quality and ease of maintenance.

## 🚀 Getting Started

### Installation
> [!Important]
> The package still has the original name, `onboard_client`, but we will switch to `onboard_sdk` soon
Add `onboard_client` to your `pubspec.yaml` file:

```yaml
dependencies:
  onboard_client:
      git:
        url: https://github.com/onboard-project/client.git
```

Then, run `flutter pub get` or `dart pub get`.

### Usage Example

See [example](example/bin/example.dart)

## 🛠️ Development Setup

To contribute to the SDK:

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/onboard-project/sdk.git
    cd sdk
    ```
2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

## 🤝 Contributing

We welcome contributions to the Onboard SDK! If you find bugs, have feature suggestions, or want to improve the existing models/methods, please open an issue or submit a pull request.

## 📄 License

This project is licensed under the [MIT License](LICENSE).

