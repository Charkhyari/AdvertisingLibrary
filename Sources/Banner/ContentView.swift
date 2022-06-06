import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    @State private var hideAllBanners: Bool = false
    @State private var showBanner: Bool = false
    @State private var tappedIndex: Int = 0
    @State private var countActionTap: Int = 0
    @State private var showDetails = true
    
    var body: some View {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        if showDetails {
            adBanner[0]
                .makeBanner(action: {
                    showDetails.toggle()
                    content.title = "Ad dismiss"
                    content.body =  "Ad has been dismissed!"
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
                    let request = UNNotificationRequest(identifier: "DismissIdentifier", content: content, trigger: trigger)
                    center.add(request) { error in
                        if let error = error {
                            print(error)
                        }
                    }
                }
                )
                .onTapGesture {
                    print("Ad triggered")
                    content.title = "Ad trigged"
                    content.body =  "Ad has been triggered!"
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
                    let request = UNNotificationRequest(identifier: "TrigerIdentifier", content: content, trigger: trigger)
                    center.add(request) { error in
                        if let error = error {
                            print(error)
                        }
                    }
                }
                .padding()
        }else {
            EmptyView()
            
        }
    }
}

var adBanner = [BannerData(actionTitle: "Close", style: .action)]

struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        };if #available(iOS 15.0, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        }
    }
}

struct EmptyView: View {
    
    @available(iOS 13.0.0, *)
    var body: some View {
        VStack {
            Text("")
        }
    }
}

