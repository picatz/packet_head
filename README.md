# Packet Head

Streaming packet header types to the command-line.

#### Command Lion & PacketGen

This command-line application is built with [Command Lion](https://github.com/picatz/command_lion) and [PacketGen](https://github.com/sdaubert/packetgen).

## Installation

    $ gem install packet_head

## Usage

To start capturing packets, the `capture` command is the only required command.

```shell
$ packet_head capture
Eth - IP - TCP
Eth - IP - UDP
Eth - IP - UDP - DNS
Eth - IP - ICMP
Eth - Dot1x
Eth - IPv6 - ICMPv6
Eth - ARP
Eth - IPv6 - ICMPv6
Eth - IP
...
```

Explictly specify the interface to capture on.

    $ packet_head capture eth0

The options for the `capture` command has several options: `snaplen`, `promisc`, `buffer` that all have default arguments if not specified.

    $ packet_head capture eth0 snaplen 65535 promisc true buffer 1

You can also read a pcap/pcapng file's headers.

    $ packet_head read name.pcap

## Help Menu

Without any argument, the application defaults to a help menu.

```shell
Packet Head

VERSION
1.0.0

DESCRIPTION
Streaming captured packet headers straight to the command-line.

COMMANDS
capture    Capture from a given network interface ( default: en0 ).
  snaplen  Amount of data for each frame that is actually captured ( default: 65535 ).
  promisc  Capture all traffic received rather than only what's meant to receive ( default: true ).
  buffer   Read time out in milliseconds when capturing packets -- 0 means no time out ( default: 1 ).

read       Read a given pcap file's packet headers to STDOUT.
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PacketHead project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/packet_head/blob/master/CODE_OF_CONDUCT.md).
