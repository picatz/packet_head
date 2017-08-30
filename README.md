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

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PacketHead project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/packet_head/blob/master/CODE_OF_CONDUCT.md).
