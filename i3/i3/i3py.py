#!/usr/bin/env python3
from i3pystatus import Status

status = Status()

status.register("clock", format="%a %-d %b %X",)
status.register("load")
status.register("mem", format="{percent_used_mem}%")
status.register("temp", format="{temp:.0f}°C",)

battery_format = ("{status}-{percentage:.2f}% {remaining:%E%h:%Mm}")
status.register("battery", format=battery_format,
                alert=True, alert_percentage=15,
                status={"DIS": "D↓",
                        "CHR": "C↑",
                        "FULL": "F=",
                        },)

# # This would look like this:
# # Discharging 6h:51m
# status.register("battery",
#                 format="{status} {remaining:%E%hh:%Mm}",
#                 alert=True,
#                 alert_percentage=5,
#                 status={
#                     "DIS":  "Discharging",
#                     "CHR":  "Charging",
#                     "FULL": "Bat full",
#                 },)


status.register("disk", path="/", format="{used}/{total}G",)

status.register("pulseaudio", format="♪{volume}",)

status.register("runwatch", name="DHCP", path="/var/run/dhclient*.pid",)


# status.register("network",
#                 interface="enp4s0f2",
#                 format_up="{v4cidr}",)

status.register("network",
                interface="wlp3s0",
                format_up="{v4cidr}",)


# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
                interface="wlp3s0",
                format_up="{essid} {quality:03.0f}%",)


status.run()
