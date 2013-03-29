var x = 0;

setTimeout(function () { x = x + 1; }, 0);
setTimeout(function () { x = x * 2; }, 0);

console.log(x);
