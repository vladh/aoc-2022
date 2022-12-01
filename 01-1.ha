use bufio;
use fmt;
use io;
use os;
use strconv;
use strings;

export fn main() void = {
	const f = os::open("./data/01-1")!;
	let sum = 0;
	let max = 0;

	for (true) {
		const line = match (bufio::scanline(f)) {
		case let l: []u8 =>
			yield strings::fromutf8(l);
		case io::EOF =>
			break;
		};
		if (line == "") {
			if (sum > max) {
				max = sum;
			};
			sum = 0;
			continue;
		} else {
			sum += strconv::stoi32(line)!;
		};
	};

	fmt::printfln("{}", max)!;
};
