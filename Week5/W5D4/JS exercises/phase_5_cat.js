function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
  this.meow = function() {
    console.log("meow");
  };
}

Cat.prototype.cuteStatement = function() {
  return `${this.owner} loves ${this.name}`;
};

const momo = new Cat("Momo", "Carmen");

console.log(momo.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return `Everyone loves ${this.name}`;
};
console.log(momo.cuteStatement());

momo.meow();
