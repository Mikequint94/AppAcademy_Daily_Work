class Clock {
  constructor() {
    const date = new Date();
    this.mins = date.getMinutes();
    this.secs = date.getSeconds();
    this.hours = date.getHours();
    this.printTime();
    let time = setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.mins}:${this.secs}`);
  }

  _tick() {
    if (this.secs < 59) {
      this.secs ++;
    } else {
      this.secs = 0;
      this.mins ++;
      if (this.mins === 60) {
        this.mins = 0;
        this.hours++;
        if (this.hours === 24 ) {
          this.hours = 0;
        }
      }
    }
    this.printTime();
  }
}

const clock = new Clock();
