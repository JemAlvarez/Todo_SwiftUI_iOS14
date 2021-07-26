//

import SwiftUI

struct SVG: View {
    let color: Color
    let image: String
    
    init(_ image: String, color: Color = .primary) {
        self.color = color
        self.image = image
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(color)
    }
}

struct SVG_Previews: PreviewProvider {
    static var previews: some View {
        SVG("square")
    }
}
