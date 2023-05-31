let arr = Array(100000000).fill(0);
// let arr = Array(10).fill(0);

for (let i = 0; i < arr.length; i++) {
    arr[i] = Math.floor(Math.random() * 1000) + 1;
}

let startTime = performance.now();
arr.sort();
let endTime = performance.now();

console.log(`Sorting took ${endTime - startTime} milliseconds`);
