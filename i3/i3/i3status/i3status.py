from i3pystatus import Status

status = Status()

status.register("clock", format="%a %-d %b %X KW%V",)
status.register("load")
status.register("temp", format="{temp:.0f}°C",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/

battery_format = ("{status}/{consumption:.2f}W {percentage:.2f}%"
                  "[{percentage_design:.2f}%] {remaining:%E%hh:%Mm}")
status.register("battery", format=battery_format,
                alert=True, alert_percentage=15,
                status={"DIS": "↓",
                        "CHR": "↑",
                        "FULL": "=",
                        },)

# This would look like this:
# Discharging 6h:51m
status.register("battery",
                format="{status} {remaining:%E%hh:%Mm}",
                alert=True,
                alert_percentage=5,
                status={
                    "DIS":  "Discharging",
                    "CHR":  "Charging",
                    "FULL": "Bat full",
                },)

status.register("runwatch", name="DHCP",
                path="/var/run/dhclient*.pid",)


status.register("network",
                interface="eth0",
                format_up="{v4cidr}",)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
                interface="wlan0",
                format_up="{essid} {quality:03.0f}%",)

# Shows disk usage of /
# Format: 42/128G [86G]
status.register("disk", path="/",
                format="{used}/{total}G [{avail}G]",)

#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio", format="♪{volume}",)

# # Shows mpd status
# # Format:
# # Cloud connected▶Reroute to Remain
# status.register("mpd",
#                 format="{title}{status}{album}",
#                 status={
#                     "pause": "▷",
#                     "play": "▶",
#                     "stop": "◾",
#                 },)

status.run()
