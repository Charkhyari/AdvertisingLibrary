import SwiftUI

public struct Banner {
    public private(set) var text = "Hello, World!"
    
    public init() {
    }
    
    @available(iOS 13.0, *)
    public func addAdBanner() {
        @ViewBuilder
        func fetchView() -> some View {
            if #available(iOS 15.0, *) {
                ContentView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}


