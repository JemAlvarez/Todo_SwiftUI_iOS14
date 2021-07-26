//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var selection = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    VStack {
                        HStack {
                            Spacer()
                            SVG(Assets.shared.getIcon(.chevron_down), color: .accentColor)
                                .frame(width: 27)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            SVG(Assets.shared.getIcon(.close), color: .red)
                                .frame(width: 27)
                                .opacity(0.7)
                                .onTapGesture {
                                    withAnimation {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Select Colors")
                            .foregroundColor(.accentColor)
                            .opacity(0.5)
                        
                        VStack {
                            HStack {
                                Spacer()
                                SVG(Assets.shared.getIcon(mainViewModel.colorPalette == 0 ? .checkbox : .square), color: .accentColor)
                                    .frame(width: 27)
                                    .opacity(mainViewModel.colorPalette == 0 ? 1 : 0.5)
                                    .onTapGesture {
                                        withAnimation {
                                            mainViewModel.colorPalette = 0
                                            UserDefaults.standard.set(mainViewModel.colorPalette, forKey: "Color")
                                        }
                                    }
                                Spacer()
                                ForEach(0..<Assets.colorSets[0].count) { i in
                                    Circle()
                                        .strokeBorder(Assets.shared.getColor(Assets.colorSets[0][i]), lineWidth: 3)
                                        .frame(width: 25, height: 25)
                                    Spacer()
                                }
                            }
                            
                            Divider()
                                .background(Color.accentColor)
                            
                            HStack {
                                Spacer()
                                SVG(Assets.shared.getIcon(mainViewModel.colorPalette != 0 ? .checkbox : .square), color: .accentColor)
                                    .frame(width: 27)
                                    .opacity(mainViewModel.colorPalette != 0 ? 1 : 0.5)
                                    .onTapGesture {
                                        withAnimation {
                                            mainViewModel.colorPalette = 1
                                            UserDefaults.standard.set(mainViewModel.colorPalette, forKey: "Color")
                                        }
                                    }
                                Spacer()
                                ForEach(0..<Assets.colorSets[1].count) { i in
                                    Circle()
                                        .strokeBorder(Assets.shared.getColor(Assets.colorSets[1][i]), lineWidth: 3)
                                        .frame(width: 25, height: 25)
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                        .background(Color("BackgroundColor").brightness(0.05))
                        .cornerRadius(15)
                    }
                    
                    Picker("", selection: $selection) {
                        Text("Dark")
                            .tag(0)
                        Text("Light")
                            .tag(1)
                        Text("Auto")
                            .tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    VStack(alignment: .leading) {
                        Text("Select Colors")
                            .foregroundColor(.accentColor)
                            .opacity(0.5)
                        
                        HStack {
                            Text("App Version")
                            
                            Spacer()
                            
                            Text("1.0.0")
                        }
                        .padding()
                        .background(Color("BackgroundColor").brightness(0.05))
                        .cornerRadius(15)
                        
                        HStack {
                            Text("Reset Settings!")
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color("BackgroundColor").brightness(0.05))
                        .cornerRadius(15)
                    }
                    .foregroundColor(.accentColor)
                    
                    Spacer()
                }
                .padding([.top, .horizontal])
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
