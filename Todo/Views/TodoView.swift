//

import SwiftUI

struct TodoView: View {
    let title: String
    let color: Color
    let checked: Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    SVG(Assets.shared.getIcon(checked ? .checkbox : .square), color: .accentColor)
                        .frame(width: 27)
                    
                    Text(title)
                        .foregroundColor(.accentColor)
                        .opacity(0.5)
                    
                    Spacer()
                    
                    Circle().strokeBorder(color, lineWidth: 3)
                        .frame(width: 25, height: 25)
                }
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 3)
                    .padding(.horizontal, 40)
                    .foregroundColor(.accentColor)
            }
        }
        .padding(10)
        .background(Color("BackgroundColor").brightness(0.05))
        .cornerRadius(15)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(title: "Text", color: .accentColor, checked: true)
            .preferredColorScheme(.dark)
    }
}
