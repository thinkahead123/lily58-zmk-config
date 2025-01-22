# Upgrade Guide for Lily58Pro

![Image 1](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0068.png)  
![Image 2](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0069.png)  

[Lily58](https://github.com/kata0510/Lily58/tree/master) is an excellent layout for those getting started with split keyboards. It has a moderate number of keys, making it easy to transition from traditional, full-sized keyboards. The keyboard is open-source, and the [Classic Pro version](https://github.com/kata0510/Lily58/tree/master/Pro/PCB) offers reversible PCB design, supporting both standard MX switches and low-profile CHOC switches.

## Background

This guide is intended for users with some experience, such as:
- Basic soldering skills.
- Ability to modify configurations.
- Basic understanding of schematics.
- Prior experience in building a Lily58 keyboard.

## Upgrade Options

1. **Wireless Conversion**  
   - Use a Bluetooth-enabled alternative to nice!nano (search for "Promicro NRF52840 development board" on Taobao).  
   - Solder the battery to B+/RAW and B-/GND. If you are unsure, refer to the relevant chip documentation.  
   - In practice, since ZMK is based on the embedded system Zephyr, the power consumption is extremely low, making the Bluetooth switch almost unnecessary.  
   - Additionally, there are [battery pack solutions](https://github.com/hazels-garage/battpack) available online, which seem promising, though I have not tested them.  
   - Since I used a PS/2 battery, I modified the 3D model of the case to accommodate the battery.  
   - [Main Branch](https://github.com/thinkahead123/lily58-zmk-config/tree/main)  

2. **Adding a Small Screen**  
   - Purchase an OLED screen.  
   - Solder header pins and corresponding jumper wires.  
   - Modify the ZMK configuration file.  
   - [Addview Branch](https://github.com/thinkahead123/lily58-zmk-config/tree/addview)  

3. **Adding a TrackPoint (Red Dot Mouse)**  
   - This upgrade is more complex and involves hardware soldering and firmware compilation.  
   - **3.1 Understanding the Principle**: Carefully read [Kim's documentation](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement) to understand the core principles and processes.  
   - **3.2 Wiring**: Solder five wires from the TrackPoint's ribbon cable to the corresponding chip pins. Refer to the [connection diagram](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/board-link-tp.png).  
   - **3.3 Installing the TrackPoint**:  
     - Use the screw holes on Lily58Pro to mount the TrackPoint.  
     - Add extension rods.  
     - Modify the case 3D model to accommodate the battery and TrackPoint chip, as shown in the [image](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/installtp1.png).  
     - Enlarge the cover hole to allow the extension rod to pass through.  
     - Trim four keycaps to make space for the TrackPoint.  
   - **3.4 Firmware Compilation**:  
     - First, credit to **Kim** for providing such excellent firmware source code.  
     - Use the precompiled firmware **"lilytp58_right-nice_nano_v2-scl_D1_sda_D0-zmk.uf2"** to update the right-hand keyboard firmware.  
     - **Issue**: When using the [online configuration tool](https://nickcoutsos.github.io/keymap-editor/), it automatically adds the following line to the keymap configuration file:  
       ```c  
       #include \<dt-bindings/zmk/pointing.h\>  
       ```  
       This line will cause the online compilation (actions) to fail. You need to manually remove it and resubmit for successful compilation.  
     - **Solution**: An automatic script `auto_modify.sh` is provided to monitor remote updates, remove the `pointing` line, and push the changes. Please understand the script before using it to automate modifications and push updates.  
     - [Trackpoint Branch](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)  

## References

### Original Project Website  
1. [Lily58 Main Website](https://github.com/kata0510/Lily58/tree/master)  

### Adding TrackPoint:  
1. [Core Principle and Process](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement)  
2. [Example ZMK Configuration File](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver-zmk_config/tree/main)  
3. [How to Integrate a TrackPoint into Your Keyboard](https://kbd.news/How-to-integrate-a-trackpoint-into-your-keyboard-2447.html)  
4. [Converting Wired to Wireless with a Battery Pack](https://github.com/hazels-garage/battpack)  
5. [TrackPoint Hardware](https://deskthority.net/wiki/TrackPoint_Hardware#2-piece_Trackpoint)  
6. [TrackPoint Adapter Board](https://github.com/sadekbaroudi/vik/tree/master/pcb/trackpoint-2-piece)  
7. [TrackPoint Extension 3D Model](https://github.com/infused-kim/kb_trackpoint_extension)  

### Similar Cases:  
- [TPS42](https://github.com/crehmann/TPS42)  
- [Trackpoint Integration by Joric](https://github.com/joric/jorne/wiki/Trackpoint)  
- [CRKBD Trackpoint](https://github.com/joh/crkbd-trackpoint)