//

import SwiftUI

class NewTodoViewModel: ObservableObject {
    @Published var text = ""
    @Published var showingColor = false
    @Published var textFieldFocused = false {
        didSet {
            if textFieldFocused == false {
                withAnimation {
                    showingColor = false
                }
            }
        }
    }
    
    func addNewTodo() {
//         if text empty add ...
    }
}
