function camelize(str: string) {
	return str.charAt(0).toUpperCase() + str.slice(1);
}

function* generateID() {
	var index = 0;
	while (true) {
		yield index++;
	}
}

var uID = generateID();

export { camelize, uID };
