import SwiftUI

struct BannerData {
    var actionTitle: String? = nil
    
    let style: Style
    
    enum Style {
        case action
    }
}

@available(iOS 15.0, *)
extension BannerData {
    func makeBanner(action: (() -> Void)? = nil) -> some View {
        switch style {
        case .action:
            return AnyView(BannerWithButton(data: self, action: action))
        }
    }
}

@available(iOS 15.0, *)
struct BannerView: ViewModifier {
    @Binding var isPresented: Bool
    let data: BannerData
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            if isPresented {
                data.makeBanner(action: action)
            }
            content
        }
    }
}

@available(iOS 15.0, *)
extension View {
    func banner(isPresented: Binding<Bool>, data: BannerData, action: (() -> Void)? = nil) -> some View {
        self.modifier(BannerView(isPresented: isPresented, data: data, action: action))
    }
}

@available(iOS 15.0, *)
struct BannerWithButton: View {
    let data: BannerData
    var action: (() -> Void)?
    
    var body: some View {
        HStack {
            Text("")
            Spacer()
            Button(action: {
                self.action?()
            }) {
                Text(data.actionTitle ?? "Action")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                    .background(Rectangle().foregroundColor(Color.black.opacity(0.3)))
            }
        }
        .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
        .background(AdView())
    }
    
}

@available(iOS 15.0, *)
struct AdView: View {
    let emoji = [Image("first"), Image("second"), Image("third")]
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { timeline in
            VStack {
                let randomEmoji = emoji.randomElement() ?? Image("second")
                
                randomEmoji
            }
        }
    }
}
