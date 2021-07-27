//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var editing = false
    @Published var colorPalette: Int
    
    init() {
        let storedColorVal = UserDefaults.standard.integer(forKey: "Color")
        colorPalette = storedColorVal
    }
}
