function titleize(names, callback) {
  names = names.map(function(name) {
    return "Mx " + name + " von Dingleberry"
    }
  );

  names.forEach( function(name) {
    callback(name);
  });
}

titleize(["Mary", "Brian", "Leo"], console.log);

function elephant(name, height, tricks) {
  this.name = name,
  this.height = height,
  this.tricks = tricks
}

console.log(new elephant('Charles', '6 inches', ['No tricks. No circus.']))
