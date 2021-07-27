//

import SwiftUI

struct MainView: View {
    @StateObject var model = MainViewModel()
    @FetchRequest(sortDescriptors: [])
    var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(0..<todos.count, id: \.self) { i in
                            TodoView(todo: todos[i], editing: $model.editing)
                                .padding(.bottom, i == todos.count - 1 ? 20 : 0)
                        }
                    }
                    
                    NewTodoView()
                }
                .padding([.horizontal, .top])
                .navigationTitle("\(todos.count) To-do\(todos.count != 1 ? "'s" : "")")
                .navigationBarItems(trailing: Button(action: {
                    withAnimation {
                        model.editing.toggle()
                    }
                }) {
                    SVG(Assets.shared.getIcon(model.editing ? .edit2 : .edit), color: .accentColor)
                }
                )
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
