#! /bin/sh
# This script prints how many packages in Pacman need to be updated

#pacman -Qu | wc -l |cat "PAC "+$_
echo PAC $(pacman -Qu |wc -l)
