import React from 'react';

class Clock extends React.Component{
  constructor(props) {
    super(props);
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);

  }

  tick() {
    this.setState({ time: new Date()});
  }

  date() {
      const [day, month, year] = [this.state.time.getDate(),
        this.state.time.getMonth()+1, this.state.time.getFullYear()];
      return `${month} / ${day} / ${year}`;
  }

  render() {
    const [date, hours, minutes, seconds] = [this.date(),
      this.state.time.getHours(),
      this.state.time.getMinutes(), this.state.time.getSeconds()];
    return (
      <div>
        <h1>David and Mike's beautiful Clock!</h1>
        <ul>
          <section className="time">
            <li>Time: </li>
            <li> {hours}:{minutes}:{seconds}</li>
          </section>

          <section className="date">
            <li>Date: </li>
            <li>{date}</li>
          </section>

        </ul>
      </div>
    );
  }
  componentDidMount() {
    this.handle = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    window.clearInterval(this.handle);
  }
}

export default Clock;
