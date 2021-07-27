//

import SwiftUI
import SwifterSwift

struct TodoView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    let todo: Todo
    @Binding var editing: Bool
    
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    HStack {
                        SVG(Assets.shared.getIcon(todo.checked ? .checkbox : .square), color: .accentColor)
                            .frame(width: 27)
                            .onTapGesture {
                                withAnimation {
                                    todo.checked.toggle()
                                }
                            }
                        
                        Text(todo.title ?? "-")
                            .foregroundColor(.accentColor)
                            .opacity(0.5)
                        
                        Spacer()
                        
                        Circle().strokeBorder(Color(UIColor(hexString: todo.color ?? "#000") ?? UIColor(.white)), lineWidth: 3)
                            .frame(width: 25, height: 25)
                    }
                    
                    if todo.checked {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 3)
                            .padding(.horizontal, 40)
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .padding(10)
            .background(Color("BackgroundColor").brightness(0.05))
            .cornerRadius(15)
            
            if mainViewModel.editing {
                SVG(Assets.shared.getIcon(.trash), color: .red.opacity(0.7))
                    .frame(width: 27)
                    .onTapGesture {
                        withAnimation{
                            PersistenceModel.shared.container.viewContext.delete(todo)
                        }
                        PersistenceModel.shared.onSaveContext()
                    }
            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(todo: Todo(context: PersistenceModel.shared.container.viewContext), editing: .constant(true))
            .preferredColorScheme(.dark)
            .environmentObject(MainViewModel())
    }
}
