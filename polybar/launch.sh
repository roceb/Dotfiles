
#!/usr/bin/env sh

# killall -q polybar

# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# export MONITOR1=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | head -n 1)
# export MONITOR2=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | sed -n 2p)

# polybar bar &
# polybar second &

# echo "Bars launched..."
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

export MONITOR1=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | head -n 1)
export MONITOR2=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | sed -n 2p)

# polybar test1 &
polybar mybar &
polybar mybar2 &
# polybar test1 &
echo "Bars launched..."
