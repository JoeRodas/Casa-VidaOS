# Casa-VidaOS Design

Casa-VidaOS is built using the Model-View-ViewModel (MVVM) pattern. Each major feature is encapsulated in its own engine module to allow future expansion.

## Modules
- **ChessboardEngine** – Renders an 8x8 board and moves pieces based on habits and challenges.
- **JournalEngine** – Handles morning/evening reflections stored via Core Data.
- **ChallengeEngine** – Manages habit streaks and random chaos events.
- **ArchetypeEngine** – Allows users to switch between historical archetypes such as Benjamin Franklin or Musashi. Each archetype can influence the UI theme and default challenges.

## Data Models
```swift
enum LifePieceType: String, CaseIterable, Identifiable {
    case king, queen, rook, bishop, knight, pawn
    var id: String { rawValue }
}

struct LifePiece: Identifiable {
    let id: UUID
    let type: LifePieceType
    let domain: String
    var position: (Int, Int)
    var progressLevel: Int
}

enum Archetype: String, CaseIterable {
    case franklin, daVinci, tesla, aurelius, musashi
}
```

## Views
- **ChessboardView** – Displays the grid of tiles with piece icons.
- **ArchetypeSelectorView** – Cards for each archetype with descriptions.
- **JournalView** – Morning and evening prompts.
- **PersonaQuizView** – Suggests an archetype after a short questionnaire.

## Wireframes
Wireframe images should be placed in `docs/wireframes/`. They illustrate the chessboard layout and the archetype selector carousel.

## Features Implemented
- Persistent storage using SwiftData.
- Chaos Engine scheduling random events.
- Weekly progress reports that can be shared.
## Future Work
- Add data persistence with SwiftData.
- Implement a Chaos Engine that schedules random events.
- Create shareable reports summarizing weekly progress.

## Architecture
The app follows MVVM. Each engine exposes a view model conforming to `ObservableObject` so SwiftUI views stay reactive. Core data types are stored using SwiftData or CoreData. The top-level `CasaVidaOSApp` composes `ArchetypeSelectorView` and `ChessboardView`.

## User Stories
- **Franklin User** – "Track my 13 virtues daily on the board." 
- **Tesla User** – "Advance the Queen of Time by completing deep work blocks." 
- **Da Vinci User** – "Leap my curiosity Knight whenever I log a new question." 
- **Musashi User** – "Disable distractions and mark discipline for the Body rook." 

