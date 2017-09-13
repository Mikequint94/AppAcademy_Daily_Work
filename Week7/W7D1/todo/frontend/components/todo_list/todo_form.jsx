import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false,
      id: this.uniqueId()
    };

    this.handleTitle = this.handleTitle.bind(this);
    this.handleBody = this.handleBody.bind(this);
    this.submitTodo = this.submitTodo.bind(this);
  }

  handleTitle() {
    return (e) => this.setState({title: e.target.value});
  }

  handleBody() {
    return (e) => this.setState({body: e.target.value});
  }
  submitTodo() {
    console.log(this.props);
    console.log(this.state);
    return (e) => this.props.receiveTodo(this.state);
  }

  uniqueId() {
    return new Date().getTime();
  }

  render() {
    return (
      <div>
        Title:
        <input onChange={this.handleTitle()} value={this.state.title}/>
        <br/>
        Body:
        <input onChange={this.handleBody()} value={this.state.body}/>
        <button onClick={this.submitTodo}>Submit!</button>
      </div>
    );
  }
}

export default TodoForm;
