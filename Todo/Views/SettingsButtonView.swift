//

import SwiftUI

struct SettingsButtonView: View {
    @State var showingSettings = false
    
    var body: some View {
        SVG(Assets.shared.getIcon(.settings), color: .accentColor)
            .frame(width: 30, height: 30)
            .padding(5)
            .background(Color("BackgroundColor").brightness(0.05))
            .cornerRadius(99)
            .onTapGesture {
                withAnimation {
                    showingSettings.toggle()
                }
            }
            .sheet(isPresented: $showingSettings, content: {SettingsView()})
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView()
    }
}
