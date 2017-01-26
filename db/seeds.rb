Todo.destroy_all

Todo.create!([
    { title: "Sweep the floor", completed: true  },
    { title: "Learn AJAX",      completed: false },
    { title: "Meditate",        completed: false }
])
