import SwiftUI

struct TodoApp: View {
    @State private var newTask: String = ""
    @State private var tasks: [Task] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter task", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                Button(action: addTask) {
                    Text("Add")
                        .padding(.trailing)
                }
            }
            List {
                ForEach(tasks) { task in
                    TaskView(task: task)
                        .onTapGesture {
                            toggleTask(task)
                        }
                }
                .onDelete(perform: deleteTask)
            }
            .padding()
        }
        .padding()
    }
    
    private func addTask() {
        guard !newTask.isEmpty else { return }
        tasks.append(Task(id: UUID(), description: newTask, isCompleted: false))
        newTask = ""
    }
    
    private func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct Task: Identifiable {
    let id: UUID
    var description: String
    var isCompleted: Bool
}

struct TaskView: View {
    var task: Task
    
    var body: some View {
        Text(task.description)
            .strikethrough(task.isCompleted)
    }
}


#Preview {
    TodoApp()
}

