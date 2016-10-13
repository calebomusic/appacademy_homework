// Callbacks, Asynchronous Functions, and Function Calls
window.setTimeout( function() {
  alert('HAMMERTIME!');
  }, 5000);
}


function hammerTime(time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  });
}


function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits?', function (res2) {
      console.log(`You replied ${res2}.`);
      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}

function Cat () {
  this.name = 'Chesire';
  this.age = 3;
}

function Dog () {
  this.name = 'Charles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Cheshire = new Cat ();
const Charles = new Dog ();
