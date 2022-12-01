use bufio;
use fmt;
use io;
use os;
use strconv;
use strings;

export fn main() void = {
	const f = os::open("./data/01-1")!;
	let sum = 0;
	let max1 = 0;
	let max2 = 0;
	let max3 = 0;

	for (true) {
		const line = match (bufio::scanline(f)) {
		case let l: []u8 =>
			yield strings::fromutf8(l);
		case io::EOF =>
			break;
		};
		if (line == "") {
			if (sum > max1) {
				max3 = max2;
				max2 = max1;
				max1 = sum;
			} else if (sum > max2) {
				max3 = max2;
				max2 = sum;
			} else if (sum > max3) {
				max3 = sum;
			};
			sum = 0;
			continue;
		} else {
			sum += strconv::stoi32(line)!;
		};
	};

	fmt::printfln("{}", max1 + max2 + max3)!;
};
