# Casa-VidaOS

Casa-VidaOS is an experimental Life Operating System for iOS built using Swift and SwiftUI. It visualizes your routines and goals as pieces on a chessboard. Inspired by historical figures like Benjamin Franklin and Leonardo da Vinci, the app encourages daily reflection, habit tracking, and virtue cultivation.

## Features
- Interactive chessboard dashboard representing life domains
- Virtue tracker with weekly focus
- Challenge engine to maintain habit streaks
- Chaos Engine introducing random events
- Archetype selector representing different play styles
- Journal for morning and evening reflection
- Persistent storage powered by SwiftData
- Shareable weekly progress reports


## Project Structure
```
Casa-VidaOS/
├── README.md
├── docs/
│   ├── DESIGN.md
│   ├── SCALING.md


│   └── wireframes/
└── LifeOSApp/
    ├── Models/
    ├── Views/
    ├── ViewModels/
    └── CasaVidaOSApp.swift
├── backend/
```

## Getting Started
1. Open `LifeOSApp` as an Xcode project or integrate these files into a new SwiftUI project.
2. Build and run the app on iOS 17 or later.
3. Use the "Weekly Report" link in the main interface to generate and share progress summaries.


## Building
This repository only includes Swift source files. Create an Xcode project named **LifeOSApp** and add the contents of `LifeOSApp/`. Ensure SwiftData/CoreData capability is enabled for persistence.

For backend deployment and scaling guidance, see `docs/SCALING.md`.


## License
MIT
