PRIMARY="eDP1"
EXT1="DP2"
EXT2="HDMI1"

if (xrandr | grep "$EXT1 connected"); then
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto --output $EXT1 --auto --right-of $PRIMARY
    echo "second screen (DOCK) enabled"
elif (xrandr | grep "$EXT2 connected"); then
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto --output $EXT2 --auto --right-of $PRIMARY
    echo "second screen (VGA) enabled"
else
    xrandr --output $EXT1 --off
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto
    echo "second screen disabled"
fi
