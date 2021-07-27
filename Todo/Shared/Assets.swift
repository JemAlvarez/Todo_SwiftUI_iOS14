//

import SwiftUI

struct Assets {
    static let shared = Assets()
    
    enum Colors {
        case blue1
        case green1
        case orange1
        case purple1
        case red1
        case blue2
        case pink2
        case purple2
        case red2
        case yellow2
    }
    
    enum Icons{
        case checkbox
        case square
        case settings
        case chevron_down
        case close
        case colors
        case trash
        case edit
        case edit2
    }
    
    func getIcon(_ icon: Icons) -> String {
        switch icon {
        case .checkbox:
            return "tick-square"
        case .square:
            return "square"
        case .settings:
            return "settings"
        case .chevron_down:
            return "arrow-down"
        case .close:
            return "close-circle"
        case .colors:
            return "color-swatch"
        case .trash:
            return "trash"
        case .edit:
            return "edit"
        case .edit2:
            return "edit-2"
        }
    }
    
    func getColor(_ color: Colors) -> Color {
        switch color {
        case .blue1:
            return Color("Blue1")
        case .green1:
            return Color("Green1")
        case .orange1:
            return Color("Orange1")
        case .purple1:
            return Color("Purple1")
        case .red1:
            return Color("Red1")
        case .blue2:
            return Color("Blue2")
        case .pink2:
            return Color("Pink2")
        case .purple2:
            return Color("Purple2")
        case .red2:
            return Color("Red2")
        case .yellow2:
            return Color("Yellow2")
        }
    }
    
    static let colorSets = [
        [Colors.blue1, Colors.green1, Colors.orange1, Colors.purple1, Colors.red1],
        [Colors.blue2, Colors.pink2, Colors.purple2, Colors.red2, Colors.yellow2]
    ]
}
