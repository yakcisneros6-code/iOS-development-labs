//
//  ContentView.swift
//  Lifecycle lab
//
//  Created by Yaquelin Cisneros on 10/21/25.
//


import SwiftUI

struct LifecycleLabApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    // Step 2: String property called "events"
    @State private var events: String = ""
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Step 2: Text view displaying the events
                ScrollViewReader { scrollView in
                    ScrollView {
                        Text(events)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .id("BOTTOM") // for auto-scrolling
                    }
                    .onChange(of: events) { _, _ in
                        withAnimation {
                            scrollView.scrollTo("BOTTOM", anchor: .bottom)
                        }
                    }
                }

                // Step 4: NavigationLink to second view
                NavigationLink("Go to Second View") {
                    SecondView(events: $events)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .navigationTitle("Lifecycle Lab")
        }
        // Step 3: ContentView lifecycle
        .onAppear { appendEvent("ContentView Appeared") }
        .onDisappear { appendEvent("ContentView Disappeared") }
        // Step 3: ScenePhase triggers
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                appendEvent("App Became Active")
            case .inactive:
                appendEvent("App Became Inactive")
            case .background:
                appendEvent("App Backgrounded")
            @unknown default:
                appendEvent("Unknown Scene Phase")
            }
        }
    }

    // Step 3: Append event with timestamp
    private func appendEvent(_ event: String) {
        let timestamp = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .none,
            timeStyle: .medium
        )
        let newLine = events.isEmpty ? "" : "\n"
        events += "\(newLine)\(timestamp): \(event)"
        print("\(timestamp): \(event)") // optional console log
    }
}

struct SecondView: View {
    @Binding var events: String

    var body: some View {
        VStack(spacing: 20) {
            Text("This is the second view")
                .font(.title)
        }
        .padding()
        // Step 3: SecondView lifecycle
        .onAppear { appendEvent("SecondView Appeared") }
        .onDisappear { appendEvent("SecondView Disappeared") }
        .navigationTitle("Second View")
    }

    // Step 3: Append event with timestamp
    private func appendEvent(_ event: String) {
        let timestamp = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .none,
            timeStyle: .medium
        )
        let newLine = events.isEmpty ? "" : "\n"
        events += "\(newLine)\(timestamp): \(event)"
        print("\(timestamp): \(event)")
    }
}

