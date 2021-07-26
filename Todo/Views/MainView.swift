//

import SwiftUI

struct MainView: View {
    @ObservedObject var model = MainViewModel()
    @FetchRequest(sortDescriptors: [])
    var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(0..<10) { _ in
                            TodoView(title: "Text", color: .blue, checked: true)
                            // if last add padding
                        }
                    }
                    
                    NewTodoView()
                }
                .padding([.horizontal, .top])
                .navigationTitle("10 To-do's")
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
