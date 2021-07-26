//

import SwiftUI

@main
struct TodoApp: App {
    
    init() {
        // navigation bar title appearance
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
        
        // segmented picker colors
        UISegmentedControl.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.primary)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.accentColor.opacity(0.5))], for: .normal)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
