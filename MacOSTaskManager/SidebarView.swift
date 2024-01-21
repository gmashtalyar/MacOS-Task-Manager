import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection?
    
    var body: some View {
        List(selection: $selection) {
            Section("Favorites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName,
                          systemImage: selection.iconName)
                    .tag(selection)
                }
            }
            
            Section("You Groups") {
                ForEach($userCreatedGroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                        .tag(TaskSection.list(group))
                        .contextMenu{
                            Button("Delete", role: .destructive) {
                                if let index = userCreatedGroups.firstIndex(where: {$0.id == group.id}) {
                                    userCreatedGroups.remove(at: index)
                                }
                            }
                        }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "NewGroup")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
        
    }
}

#Preview {
    SidebarView(userCreatedGroups: .constant(TaskGroup.examples()),selection: .constant(.all))
        .listStyle(.sidebar)
}
