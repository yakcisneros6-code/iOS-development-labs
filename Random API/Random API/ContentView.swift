
 import SwiftUI

@main
struct RandomAPIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DogTabView()
                    .tabItem {
                        Label("Dogs", systemImage: "pawprint")
                    }
                
                RepresentativeTabView()
                    .tabItem {
                        Label("Representatives", systemImage: "person.3")
                    }
            }
        }
    }
}

#Preview {
    TabView {
        DogTabView()
            .tabItem { Label("Dogs", systemImage: "pawprint") }
        
        RepresentativeTabView()
            .tabItem { Label("Representatives", systemImage: "person.3") }
    }
}

