//

import SwiftUI

struct NewTodoView: View {
    @ObservedObject var model = NewTodoViewModel()
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        HStack {
            TextField("Write new todo ...", text: $model.text, onEditingChanged: { changed in
                withAnimation {
                    model.textFieldFocused = changed
                }
            }) {
                withAnimation {
                    model.addNewTodo()
                }
            }
            .foregroundColor(.accentColor)
            .padding(10)
            .padding(.horizontal, 10)
            .background(Color("BackgroundColor").brightness(0.05))
            .cornerRadius(99)
            .frame(maxWidth: model.textFieldFocused ? .infinity : UIScreen.main.bounds.width * 0.4)
            
            if model.textFieldFocused {
                HStack {
                    if model.showingColor {
                        HStack {
                            ForEach(0..<Assets.colorSets[0].count) { i in
                                Circle()
                                    .stroke(Assets.shared.getColor(Assets.colorSets[mainViewModel.colorPalette][i]), lineWidth: 3)
                                    .frame(width: 25, height: 25)
                                    .onTapGesture {
                                        withAnimation {
                                            model.selectedColor = i
                                            model.showingColor = false
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    SVG(Assets.shared.getIcon(.colors), color: Assets.shared.getColor(Assets.colorSets[mainViewModel.colorPalette][model.selectedColor]).opacity(0.5))
                        .frame(width: 27)
                        .onTapGesture {
                            withAnimation {
                                model.showingColor.toggle()
                            }
                        }
                }
            } else {
                SettingsButtonView()
            }
            
            if !model.text.isEmpty {
                SVG(Assets.shared.getIcon(.circle_checkbox), color: .accentColor)
                    .frame(width: 27)
                    .onTapGesture {
                        withAnimation {
                            model.addNewTodo()
                            UIApplication.shared.endEditing()
                        }
                    }
            }
        }
        .padding(.bottom, model.textFieldFocused ? 10 : 0)
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
