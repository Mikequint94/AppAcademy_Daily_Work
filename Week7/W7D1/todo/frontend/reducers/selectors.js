
const allTodos = function(state) {
  let todoKeys = Object.keys(state.todos);
  let todoArray = [];
  todoKeys.map( (todoId) => {
    todoArray.push(state.todos[todoId]);
  });
  return todoArray;
};

export default allTodos;
