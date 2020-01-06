//
//  ContentView.swift
//  TaskList
//
//  Created by steven weiss on 12/15/19.
//  Copyright © 2019 steven weiss. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var taskStore = TaskStore()
    
    var body: some View {
//        List(taskStore.tasks.indices) { index in
//            Text( self.taskStore.tasks[index].name )
//        }
        List(taskStore.tasks, id: \.id) { task in
            Text(task.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
