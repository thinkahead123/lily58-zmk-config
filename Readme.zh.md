
# lily58Pro 升级

![图片1](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0068.png)
![图片2](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0069.png)


[Lily58](https://github.com/kata0510/Lily58/tree/master)是非常适合接触分体式键盘的布局，按键数量适中，容易从普通的多按键的键盘过渡过来。

该键盘开源，并且[经典版本Pro](https://github.com/kata0510/Lily58/tree/master/Pro/PCB)提供了pcb可逆设计，同时支持普通轴MX，矮轴CHOC。

## 背景
面向有一定基础，比如：
	能够焊接/修改配置/简单查看电路图等。
	已经具有制作lily58键盘的经验。
  
## 升级条目

1. 改造成为无线。[main分支](https://github.com/thinkahead123/lily58-zmk-config/tree/main)

2. 增加小屏幕。[addview分支](https://github.com/thinkahead123/lily58-zmk-config/tree/addview)

3. 增加红点鼠标。[trackpoint分支](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)

## 修改方式


### === 1. 改造成为无线。===  

---


 * 使用带蓝牙的nice!nano的替代品(淘宝搜索: Promicro NRF52840开发板)
 * 电池需要焊接到B+/RAW和B-/GND，如果你不清楚什么意思，查看相关芯片手册。
   实际使用感受，因为zmk基于嵌入式系统zephyr，实测能耗极低，蓝牙开关用处不大。
   除此之外，网上有[电池背包](https://github.com/hazels-garage/battpack)的方案，看上去不错。我没有实验过。
 * 由于本人使用了ps/2的电池，故修改外壳3d模型，以放下电池。


### === 2. 增加小屏幕。===  

---


* 购买oled屏
* 焊接排针和对应的跳线
* 修改zmk配置文件

### === 3. 增加红点鼠标。===  

---


   难度较大，涉及到硬件焊接，固件编译。
   
   3.1. 原理理解。
   		必须仔细阅读[kim的文档](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement)，了解核心原理和过程。
   		
   3.2. 焊接连线。
   		5根线，分别从指点杆附带的排线中引出，接入芯片的引脚之上，关键，在Lily58上对应
     硬件连接，![连接图](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/board-link-tp.png)
		
  3.3. 指点杆安装。
  		利用Lily58Pro的螺丝孔安装；
  		添加延长杆；
  		修改外壳模型，以放置电池和指点杆的芯片部分，提供安装指点杆的位置，![如图](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/installtp1.png)；
  		加大盖板的孔的尺寸以允许延长杆通过；
  		修剪4个键帽以允许指点的放置。
  		
  
  3.4. 固件的编译。  [trackpoint分支](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)
  
首先，还是致敬**kim**提供了如此优秀的固件源代码。
	
> 请使用编译好的，**"lilytp58_right-nice\_nano\_v2-scl\_D1\_sda_D0-zmk.uf2"**，这个版本更新右手键盘固件。

	问题：我们使用[在线配置工具](https://nickcoutsos.github.io/keymap-editor/)，
	它自动会为我们的keymap配置文件添加一行:	
	
		#include <dt-bindings/zmk/pointing.h>
			
	这行会导致固件的在线编译（actions）失败。 需要手动去掉这行，
	再次提交才能编译通过。
	
	** 提供了一个脚本auto_modify.sh完成自动监测远程更新，自动删除pointing这行代码，并自动推送的脚本文件auto_modify.sh，请在理解之后让它为你完成自动修改和推送**。
	

## 参考

### 原始主体网站  

1. https://github.com/kata0510/Lily58/tree/master  主体网站
  

### 增加trackpoint：

1. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement  核心原理和过程

2. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver-zmk_config/tree/main  zmk-config配置文件示例

3. https://kbd.news/How-to-integrate-a-trackpoint-into-your-keyboard-2447.html  最新的这篇文章基本上说的比较清楚

4. https://github.com/hazels-garage/battpack  有线转无线——在nice nano上增加一个小电路板

5. https://deskthority.net/wiki/TrackPoint_Hardware#2-piece_Trackpoint  红点鼠标的各种硬件

6. https://github.com/sadekbaroudi/vik/tree/master/pcb/trackpoint-2-piece  红点鼠标转接板

7. https://github.com/infused-kim/kb_trackpoint_extension  提供红点鼠标增高杆的3d模型

### 类似的案例：

* https://github.com/crehmann/TPS42

* https://github.com/joric/jorne/wiki/Trackpoint

* https://github.com/joh/crkbd-trackpoint