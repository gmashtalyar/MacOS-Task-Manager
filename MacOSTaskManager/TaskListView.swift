import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
        
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
        .toolbar {
            Button {
                tasks.append(Task(title: "New Task"))
            } label: {
                Label("Add New Task", systemImage: "plus")
            }
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
