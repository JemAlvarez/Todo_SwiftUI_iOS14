//

import SwiftUI

class NewTodoViewModel: ObservableObject {
    @Published var text = ""
    @Published var showingColor = false
    @Published var color = Assets.shared.getColor(.blue1)
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
        if !text.isEmpty {
            let newTodo = Todo(context: PersistenceModel.shared.container.viewContext)
            newTodo.title = text
            newTodo.checked = false
            PersistenceModel.shared.onSaveContext()
        }
        
        text = ""
        color = Assets.shared.getColor(.blue1)
    }
}
