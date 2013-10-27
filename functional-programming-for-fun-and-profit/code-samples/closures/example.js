function counter() {
	var x = 0;

	function increment(y) {
		x += y;
		console.log(x);
	}

	return increment;
}

first_counter  = counter();
second_counter = counter();

console.log("first");
first_counter(1)   // returns 1
first_counter(2)   // returns 3
first_counter(3)   // returns 6

console.log("second");
second_counter(5)   // returns 5
second_counter(5)   // returns 10
second_counter(5)   // returns 15