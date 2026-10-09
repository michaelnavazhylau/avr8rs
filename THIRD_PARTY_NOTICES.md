# Third-party notices

`avr8rs` is an independent reimplementation of AVR8js. It contains derived work
and, at test time, temporarily installs third-party toolchains. Those components
keep their own licenses. The MIT license in [`LICENSE`](LICENSE) covers only this
project's own code.

Nothing listed on this page is redistributed in this repository.

## AVR8js — derived work (MIT)

The native simulator (`src/sim/`), the scenario representation
(`src/scenario.rs`) and the scenario runner (`src/runtime.rs`) are derived from
AVR8js (<https://github.com/wokwi/avr8js>), pinned as a submodule at revision
`bee6f0a94e0e27786f6bc21aee3c775849fb50fd`.

The converted behavioral suites are the largest derived work and live in the
separate [`avr8js-parity`](https://github.com/michaelnavazhylau/avr8js-parity)
repository, which pins the same revision as a live submodule and carries its own
copy of the upstream notice.

The upstream notice is retained below and in [`LICENSE`](LICENSE), and individual
derived files carry an SPDX header identifying the upstream copyright.

```
The MIT License (MIT)

Copyright (c) 2019-2025 Uri Shaked

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

## Arduino AVR boards core (`arduino:avr`) — not redistributed

`tests/arduino_cli.rs` installs the `arduino:avr` platform through `arduino-cli`
in order to compile the sketch in `tests/arduino-cli/uno_probe`. The platform is
fetched from Arduino's package index at test time and is not part of this
repository. It is distributed under Arduino's own license terms; see the
installed package for the applicable license.

## arduino-cli — not redistributed

The `Arduino CLI end-to-end` workflow downloads a SHA-256-pinned `arduino-cli`
release binary. It is licensed under the GNU General Public License v3.0; the
release archive ships the GPL-3.0 text as `LICENSE.txt`. It is not part of this
repository.

## Microchip / Atmel documents — not redistributed

`specs/` cites official Microchip ATmega and ATtiny datasheets and the AVR
Instruction Set Manual as hardware references. These documents retain their
own vendor copyright and terms and are **not** covered by this project's MIT
license. They are excluded from Git; only their provenance — URL, revision, page
count and SHA-256 hash — is published, in [`specs/sources.json`](specs/sources.json).

## Rust dependencies

`avr8rs` has an empty `[dependencies]` table, so no third-party Rust code is
compiled into the AVR simulator, its scenario runner or its parity gate.

Its consumers are separate repositories and carry their own notices. The
`arduino-sim-rs` front-end pulls in ngspice-rs and raylib; the `avr8js-parity`
contract pulls in Node and TypeScript to regenerate scenarios.
