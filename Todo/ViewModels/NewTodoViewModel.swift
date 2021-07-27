//

import SwiftUI
import SwifterSwift

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
    @Published var selectedColor = 0
    
    func addNewTodo() {
        if !text.isEmpty {
            let newTodo = Todo(context: PersistenceModel.shared.container.viewContext)
            newTodo.title = text
            newTodo.checked = false
            newTodo.color = UIColor(Assets.shared.getColor(Assets.colorSets[UserDefaults.standard.integer(forKey: "Color")][selectedColor])).hexString
            PersistenceModel.shared.onSaveContext()
        }
        
        text = ""
    }
}
