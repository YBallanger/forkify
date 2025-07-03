## Description

This mobile application, developed with Flutter, allows users to easily log the restaurants they visit. It provides an intuitive interface to add new entries, detail the dining experience, and most importantly, generate insightful statistics based on the recorded visits. Whether you want to know which type of cuisine you eat most often or how many new restaurants you've discovered this month, this app is for you!

## Features

*   **Add Restaurant Visits:** Record details of visited restaurants (name, date, notes, etc.).
*   **View Visit History:** Browse through the history of all your logged visits.
*   **Detailed Statistics:** Get insights into your dining habits (e.g., most visited restaurants, cuisine distribution, visit frequency, etc.).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Make sure you have Flutter and Dart installed on your machine. You can follow the official Flutter installation guide: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/YBallanger/forkify.git
    ```
2.  Navigate to the project directory:
   
3.  Install the dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

1.  Connect a device (simulator or physical) to your machine.
2.  Run the forkify API available on [github](https://github.com/YBallanger/forkify-backend.git)
3.  Run the application:
    ```bash
    flutter run --dart-define=REST_API_URL=http://localhost:8080
    ```
