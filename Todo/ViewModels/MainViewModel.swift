//

import Foundation

class MainViewModel: ObservableObject {
    @Published var editing = false
    @Published var colorPalette: Int
    
    init() {
        colorPalette = UserDefaults.standard.integer(forKey: "Color")
    }
}
