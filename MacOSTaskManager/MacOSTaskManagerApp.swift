import SwiftUI

@main
struct MacOSTaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add new Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            CommandGroup(after: .newItem) {
                Button("Add new Group") {
                    
                }
            }
        }
        WindowGroup("Special windown") {
            Text("special window")
                .frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .defaultPosition(.leading)
        
        Settings {
            Text("Settings")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        MenuBarExtra("Menu") {
            Button("Do smth") {
                
            }
        }
    }
}
