# Lily58Pro Upgrade  [Chinese中文](https://github.com/thinkahead123/lily58-zmk-config/blob/main/Readme.zh.md)


![Image 1](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0068.png)
![Image 2](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0069.png)

[Lily58](https://github.com/kata0510/Lily58/tree/master) is a very suitable layout for those transitioning to split keyboards, with a moderate number of keys, making it easy to move from a standard multi-key keyboard.

This keyboard is open-source, and the [classic Pro version](https://github.com/kata0510/Lily58/tree/master/Pro/PCB) offers a reversible PCB design, supporting both standard MX switches and low-profile CHOC switches.

## Background
This guide is aimed at those with some experience, such as:
- Ability to solder/modify configurations/simple circuit diagram reading.
- Prior experience in building the Lily58 keyboard.

## Upgrade Items

1. Convert to wireless. [main branch](https://github.com/thinkahead123/lily58-zmk-config/tree/main)

2. Add a small screen. [addview branch](https://github.com/thinkahead123/lily58-zmk-config/tree/addview)

3. Add a trackpoint mouse. [trackpoint branch](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)

## Modification Methods

### === 1. Convert to Wireless ===  

---

* Use a Bluetooth-enabled nice!nano alternative (search on Taobao: Promicro NRF52840 development board).
* Solder the battery to B+/RAW and B-/GND. If you're unsure what this means, refer to the relevant chip manual.
  In practice, since ZMK is based on the embedded system Zephyr, the power consumption is extremely low, and the Bluetooth switch is not very useful.
  Additionally, there is a [battery backpack](https://github.com/hazels-garage/battpack) solution available online, which looks promising. I have not tested it.
* Since I used a PS/2 battery, I modified the 3D model of the case to accommodate the battery.

### === 2. Add a Small Screen ===  

---

* Purchase an OLED screen.
* Solder the pin headers and corresponding jumpers.
* Modify the ZMK configuration file.

### === 3. Add a Trackpoint Mouse ===  

---

   This is more challenging, involving hardware soldering and firmware compilation.
   
   3.1. Understand the principles.
         Carefully read [kim's documentation](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement) to understand the core principles and process.
         
   3.2. Soldering connections.
         Five wires need to be connected from the trackpoint's ribbon cable (||1:Data||2:Reset||6:CLK||7:GND||8:VCC||) to the chip pins. Key connections on the Lily58 are as follows:
         
Trackpoint Ribbon Cable  | Promicro Chip Pins
------------- | -------------
1:Data  | D0
2:Reset  | D4
3:|
4:|
5:|
6:CLK| D1
7:GND| GND
8:VCC| VCC
9:|
10:|
	
Note that the pin numbering in the table is not the physical order. Refer to the ![connection diagram](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/link-trackpoint.png).
Hardware connection, ![connection diagram](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/board-link-tp.png)
		
  3.3. Trackpoint installation.
        Use the Lily58Pro's screw holes for installation;
        Add an extension rod, [see link](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint/3dmodel);
        Modify the [case model](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint/3dmodel) to accommodate the battery and the trackpoint's chip, providing a location for the trackpoint, ![as shown](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/installtp1.png);
        Enlarge the holes in the cover plate to allow the extension rod to pass through;
        Trim four keycaps to allow placement of the trackpoint.
        
  
  3.4. Firmware compilation.  [trackpoint branch](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)
  
First, a tribute to **kim** for providing such excellent firmware source code.

> Please use the compiled version, **"lilytp58_right-nice\_nano\_v2-scl\_D1\_sda_D0-zmk.uf2"**, which updates the firmware for the right-hand keyboard.

	
	The biggest challenge during initial compilation was that the keyboard's default name, Lily58, caused ZMK to search for default configurations, preventing our modified configurations from taking effect. After changing the name to Lilytp58, the issue was resolved.    

The downside is that using the firmware source code does not allow for upgrades with the main ZMK version. This results in the loss of pointing and studio functionalities.

	Issue one: The lack of pointing functionality prevents us from using some mouse button simulation features.
	We use the [online configuration tool](https://nickcoutsos.github.io/keymap-editor/),
	which automatically adds a line to our keymap configuration file:
	
		#include <dt-bindings/zmk/pointing.h>
		
	
	This line causes the firmware's online compilation (actions) to fail. It needs to be manually removed,
	and then resubmitted for successful compilation.
	** A script, auto_modify.sh, is provided to automatically monitor remote updates, remove the pointing line,
	and automatically push the changes. Please understand it before letting it handle automatic modifications and pushes**.
	
	Issue two: The lack of studio functionality prevents the use of ZMK Studio's quick key value modification capabilities.


	
  

## References

### Original Main Websites  

1. https://github.com/kata0510/Lily58/tree/master  Main website
  

### Adding Trackpoint:

1. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement  Core principles and process

2. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver-zmk_config/tree/main  ZMK-config configuration file example

3. https://kbd.news/How-to-integrate-a-trackpoint-into-your-keyboard-2447.html  This recent article explains it quite clearly

4. https://github.com/hazels-garage/battpack  Wired to wireless—adding a small circuit board to nice nano

5. https://deskthority.net/wiki/TrackPoint_Hardware#2-piece_Trackpoint  Various hardware for trackpoint mice

6. https://github.com/sadekbaroudi/vik/tree/master/pcb/trackpoint-2-piece  Trackpoint adapter board

7. https://github.com/infused-kim/kb_trackpoint_extension  3D model for trackpoint extension rod

### Similar Cases:

* https://github.com/crehmann/TPS42

* https://github.com/joric/jorne/wiki/Trackpoint

* https://github.com/joh/crkbd-trackpoint