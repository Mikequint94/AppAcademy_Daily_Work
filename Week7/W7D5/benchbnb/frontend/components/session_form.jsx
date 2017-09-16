import React from 'react';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleInput = this.handleInput.bind(this);
  }

  handleInput(key){
    return event => {
      this.setState({
        [key]: event.target.value
      });
    };
  }

  handleSubmit(event){
    event.preventDefault();
    const user = Object.assign({}, this.state);

    this.props.processForm(user);
  }

  render() {

    const errors = (

        this.props.errors.map(err => <li>{err}</li>)

    );

    return (
      <div>
        <header>
            <h1>
              {this.props.formType === 'login' ? 'Log in' : 'Sign up'}
            </h1>
        </header>

        <form onSubmit={this.handleSubmit.bind(this)}>
          <label>
            Username
            <input type="text" onChange={this.handleInput('username')}
                               value={this.state.username}/>
          </label><br />
          <label>
            Password
            <input type="text" onChange={this.handleInput('password')}
                               value={this.state.password}/>
          </label><br></br>

          <input type='submit' value="{this.props.formType}!" />
        </form>

        {
          this.props.formType === 'login' ? (
            <Link to="/signup" />
          ) : (
            <Link to="/login" />
          )
        }

        {
          <ul>
            {errors}
          </ul>
        }
      </div>
    );
  }
}

export default SessionForm;
