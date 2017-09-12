import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    // console.log(this.props.todos);
  }
  render() {
    const {todos, receiveTodo} = this.props;

    const todoItems = todos.map(todo => (
      <TodoListItem
        key = {`todo-list-item${todo.id}`}
        todo={todo} />
    ));

    return (
      <div>
        <ul>
          {todoItems}
        </ul>
        <TodoForm receiveTodo={receiveTodo}/>
      </div>
    );
  }
}


export default TodoList;
