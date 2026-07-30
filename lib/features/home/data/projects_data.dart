import '../model/project_model.dart';

const projects = [
  /// ==============================
  /// SHOP APP
  /// ==============================
  ProjectModel(
    title: "Shop App",

    description:
        "A production-ready Flutter e-commerce application featuring authentication, product browsing, checkout, localization, and modern user experience.",

    problem:
        "Many shopping applications suffer from slow performance, poor scalability, and inconsistent user experience across different devices.",

    solution:
        "Developed a scalable Flutter application following MVVM architecture with BLoC state management, REST APIs, localization, and reusable components to ensure maintainability and performance.",

    features: [
      "User Authentication",
      "Product Catalog",
      "Categories",
      "Product Search",
      "Favorites",
      "Shopping Cart",
      "Checkout Flow",
      "Order Tracking",
      "Profile Management",
      "Arabic & English Localization",
      "Responsive UI",
      "Payment Integration",
      "Gesture-based Navigation",
      "Floating Draggable Cart",
    ],

    technologies: [
      "Flutter",
      "BLoC",
      "MVVM",
      "REST API",
      "Dio",
      "Firebase",
      "Localization",
    ],

    images: [
      "assets/projects/shop/1.jpg",
      "assets/projects/shop/2.jpg",
      "assets/projects/shop/3.jpg",
      "assets/projects/shop/4.jpg",
      "assets/projects/shop/5.jpg",
      "assets/projects/shop/6.jpg",
      "assets/projects/shop/7.jpg",
      "assets/projects/shop/8.jpg",
      "assets/projects/shop/9.jpg",
      "assets/projects/shop/10.jpg",
      "assets/projects/shop/11.jpg",
    ],

    github: "https://github.com/tasneemmagdy/E-commerce-",
demo: null,
  ),

  /// ==============================
  /// MINIGRAM (no images available)
  /// ==============================
  ProjectModel(
    title: "MiniGram",

    description:
        "A real-time social media application built with Flutter and Firebase that enables users to share posts, interact, and communicate instantly.",

    problem:
        "Users expect real-time social interaction with smooth performance and instant content updates.",

    solution:
        "Built a scalable Flutter social platform powered by Firebase services and Cubit state management with responsive UI and real-time synchronization.",

    features: [
      "Authentication",
      "User Profiles",
      "Create Posts",
      "Image Upload",
      "Likes",
      "Comments",
      "Real-time Updates",
      "Profile Editing",
    ],

    technologies: [
      "Flutter",
      "Firebase",
      "Cubit",
      "Firestore",
      "Storage",
      "Streams",
    ],

    images: [
        "assets/projects/minigram/logo.png",

    ],

    github: "https://github.com/tasneemmagdy/MiniGram",

demo: "https://lnkd.in/p/dETR3Kjk",
  ),

  /// ==============================
  /// TASKFLOW
  /// ==============================
  ProjectModel(
    title: "TaskFlow",

    description:
        "An offline-first task management application built using Clean Architecture and Hive for fast local storage and maintainable code.",

    problem:
        "Users need an efficient way to organize tasks even without internet connectivity.",

    solution:
        "Implemented a robust offline task management solution with Clean Architecture, local persistence, and intuitive user experience.",

    features: [
      "Create Tasks",
      "Edit Tasks",
      "Delete Tasks",
      "Task Priorities",
      "Task Categories",
      "Offline Storage",
      "Search",
      "Filtering",
    ],

    technologies: ["Flutter", "Clean Architecture", "Hive", "GetX"],

    images: [
      "assets/projects/taskflow/1.jpg",
      "assets/projects/taskflow/2.jpg",
      "assets/projects/taskflow/3.jpg",
      "assets/projects/taskflow/4.jpg",
    ],

    github: "https://github.com/tasneemmagdy/taskflow",

demo: null,
  ),

  /// ==============================
  /// DASHBOARD
  /// ==============================
  ProjectModel(
    title: "Analytics Dashboard",

    description:
        "A responsive analytics dashboard that visualizes time-series data through interactive charts and API-driven insights.",

    problem:
        "Organizations require clear visualization of large datasets to support informed decision-making.",

    solution:
        "Built an interactive dashboard with clean architecture principles, responsive layouts, and dynamic charts connected to REST APIs.",

    features: [
      "Interactive Charts",
      "Time Series",
      "Statistics",
      "API Integration",
      "Responsive Layout",
      "Filtering",
      "Dashboard Cards",
    ],

    technologies: ["Flutter", "REST API", "Charts", "State Management"],

    images: [
      "assets/projects/dashboard/1.jpg",
      "assets/projects/dashboard/2.jpg",
      "assets/projects/dashboard/3.jpg",
    ],

    github: "https://github.com/tasneemmagdy/bitcoin-dashboard",

demo: null,
  ),
];
