# Lily58Pro Upgrade [Chinese中文](https://github.com/thinkahead123/lily58-zmk-config/blob/main/Readme.zh.md)

![Image 1](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0068.png)
![Image 2](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0069.png)

[Lily58](https://github.com/kata0510/Lily58/tree/master) is an excellent layout for those new to split keyboards. It has a moderate number of keys, making it easy to transition from a traditional multi-key keyboard.

This keyboard is open-source, and the [classic Pro version](https://github.com/kata0510/Lily58/tree/master/Pro/PCB) offers a reversible PCB design, supporting both standard MX switches and low-profile CHOC switches.

## Background
This guide is aimed at individuals with some experience, such as:
- Ability to solder/modify configurations/simple circuit diagram reading.
- Prior experience in building the Lily58 keyboard.

## Upgrade Items

1. Convert to wireless. [Main branch](https://github.com/thinkahead123/lily58-zmk-config/tree/main)

2. Add a small screen. [Addview branch](https://github.com/thinkahead123/lily58-zmk-config/tree/addview)

3. Add a TrackPoint mouse. [Trackpoint branch](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)

## Modification Methods

### === 1. Convert to Wireless ===  

---

* Use a Bluetooth-enabled nice!nano alternative (search on Taobao: Promicro NRF52840 development board).
* The battery needs to be soldered to B+/RAW and B-/GND. If you're unsure what this means, refer to the relevant chip manual.
  In practice, since ZMK is based on the embedded system Zephyr, power consumption is extremely low, and the Bluetooth switch is not very useful.
  Additionally, there is a [battery backpack](https://github.com/hazels-garage/battpack) solution online that looks promising. I have not tested it.
* Since I used a PS/2 battery, I modified the 3D model of the case to accommodate the battery.

### === 2. Add a Small Screen ===  

---

* Purchase an OLED screen.
* Solder the pin headers and corresponding jumpers.
* Modify the ZMK configuration file.

### === 3. Add a TrackPoint Mouse ===  

---

   This is more challenging, involving hardware soldering and firmware compilation.
   
   3.1. Understand the principles.
         Carefully read [Kim's documentation](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement) to grasp the core principles and process.
         
   3.2. Solder the connections.
         Five wires need to be connected from the TrackPoint's ribbon cable to the chip's pins. Key connections on the Lily58 are shown in the [connection diagram](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/board-link-tp.png).
		
   3.3. Install the TrackPoint.
         Use the Lily58Pro's screw holes for installation;
         Add an extension rod;
         Modify the case model to accommodate the battery and the TrackPoint's chip, providing a mounting position for the TrackPoint, as shown in the [image](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/installtp1.png);
         Enlarge the holes in the cover plate to allow the extension rod to pass through;
         Trim four keycaps to allow placement of the TrackPoint.
  		
  
   3.4. Compile the firmware. [Trackpoint branch](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)
  
First, a tribute to **Kim** for providing such excellent firmware source code.
	
> Please use the pre-compiled version, **"lilytp58_right-nice\_nano\_v2-scl\_D1\_sda_D0-zmk.uf2"**, which updates the firmware for the right-hand keyboard.

	Issue: When using the [online configuration tool](https://nickcoutsos.github.io/keymap-editor/),
	it automatically adds a line to our keymap configuration file:
	
		#include <dt-bindings/zmk/pointing.h>
			
	This line causes the firmware's online compilation (actions) to fail. You need to manually remove this line,
	then resubmit to successfully compile.
	
	** A script auto_modify.sh is provided to automatically monitor remote updates, remove the pointing line, and automatically push the changes. Please understand it before letting it handle the automatic modifications and pushes for you.**
	

## References

### Original Main Websites  

1. https://github.com/kata0510/Lily58/tree/master  Main website
  

### Adding TrackPoint:

1. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement  Core principles and process

2. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver-zmk_config/tree/main  ZMK-config configuration file example

3. https://kbd.news/How-to-integrate-a-trackpoint-into-your-keyboard-2447.html  The latest article that explains things quite clearly

4. https://github.com/hazels-garage/battpack  Wired to wireless—adding a small circuit board to the nice nano

5. https://deskthority.net/wiki/TrackPoint_Hardware#2-piece_Trackpoint  Various TrackPoint hardware

6. https://github.com/sadekbaroudi/vik/tree/master/pcb/trackpoint-2-piece  TrackPoint adapter board

7. https://github.com/infused-kim/kb_trackpoint_extension  Provides 3D models for TrackPoint extension rods

### Similar Cases:

* https://github.com/crehmann/TPS42

* https://github.com/joric/jorne/wiki/Trackpoint

* https://github.com/joh/crkbd-trackpoint