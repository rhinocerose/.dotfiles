function newsketch
    arduino-cli sketch new "$argv"
end

function nanobuild
    arduino-cli compile --fqbn arduino:avr:nano:cpu=atmega328 "$argv"
end

function nanoflash
    sudo avrdude -c avrisp2 -p m328p -U flash:w:build/arduino.avr.nano/"$argv"
end
