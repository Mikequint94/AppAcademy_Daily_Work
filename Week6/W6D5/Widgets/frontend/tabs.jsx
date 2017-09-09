import React from 'react';

class Headers extends React.Component {
  render() {
    let selected = this.props.index;
    let headers = this.props.panes.map((pane, index) => {
      let title = pane.title;
      let klass = '';
      if (index === selected) {
        klass = 'active';
      }

      return (
        <li
          key={index}
          className={klass}
          onClick={this.props.onTabChosen.bind(null, index)}>
          {title}{' '}
        </li>
      );
    });
    return (
      <ul className='tab-header'>
        {headers}
      </ul>

    );
 }
}

class Tabs extends React.Component{
  constructor(props) {
    super(props);
    this.state = {index: 0};
    this.changeState = this.changeState.bind(this);

  }
  changeState(num) {
    this.setState({index: num});
  }

  render() {
    let tab = this.props.panes[this.state.index];
    return (
      <div className="tabs">
        <h1>Tabs</h1>
        <div className= 'tabscontainer'>
          <div className='tabs'>
          <Headers
            selectedPane={this.state.index}
            onTabChosen={this.changeState}
            panes={this.props.panes}>
          </Headers>
          <div className='tab-content'>
            <article>
              {tab.content}
            </article>
          </div>
        </div>

        </div>

      </div>
    );
  }

}

export default Tabs;
