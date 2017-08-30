require "packetgen"
require "command_lion"
require "colorize"
require "packet_head/version"

module PacketHead

  trap("SIGINT") { exit 0 }

  CommandLion::App.run do
    name "Packet Head".colorize(:yellow)
    version PacketHead::VERSION
    description "Streaming captured packet headers straight to the command-line."

    command :capture do
      description "Capture from a given network interface ( default: #{Pcap.lookupdev.colorize(:yellow)} )."
      type :string
      default Pcap.lookupdev

      action do
        capture = Pcap.open_live(argument, options[:snaplen].argument, options[:promisc].argument, options[:buffer].argument)
        loop do
          while packet = capture.next
            begin
              puts PacketGen.parse(packet).headers.map(&:class).map {|h| h.to_s.split("::").last }.join(" - ")
            rescue
              # some error, yolo
              nil
            end 
          end
        end
      end

      option :snaplen do
        default 65535
        type :integer
        description "Amount of data for each frame that is actually captured ( default: #{default.to_s.colorize(:yellow)} )."
      end

      option :promisc do
        type :bool
        default true
        description "Capture all traffic received rather than only what's meant to receive ( default: #{default.to_s.colorize(:yellow)} )."
      end

      option :buffer do
        type :integer
        default 1
        description "Read time out in milliseconds when capturing packets -- 0 means no time out ( default: #{default.to_s.colorize(:yellow)} )."
      end
    end

    command :read do
      description "Read a given pcap file's packet headers to STDOUT."
      type :string

      before do
        unless File.extname(argument).downcase == ".pcap" || File.extname(argument).downcase == ".pcapng"
          puts "Please provide a .pcap or .pcapng file!"
          exit 1
        end
      end

      action do
        packets = PacketGen.read(argument)
        packets.each do |packet|
          puts packet.headers.map(&:class).map {|h| h.to_s.split("::").last }.join(" - ")
        end
      end
    end


  end
end
