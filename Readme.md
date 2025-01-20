
# lily58Pro 升级

![图片1](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0068.jpeg)
![图片2](https://github.com/thinkahead123/lily58-zmk-config/blob/main/refers/IMG_0069.jpeg)


[Lily58](https://github.com/kata0510/Lily58/tree/master)是非常适合接触分体式键盘的布局，按键数量适中，容易从普通的多按键的键盘过渡过来。

该键盘开源，并且[经典版本Pro](https://github.com/kata0510/Lily58/tree/master/Pro/PCB)提供了pcb可逆设计，同时支持普通轴MX，矮轴CHOC。

  
## 升级条目

1. 改造成为无线。[main分支](https://github.com/thinkahead123/lily58-zmk-config/tree/main)

2. 增加小屏幕。[addview分支](https://github.com/thinkahead123/lily58-zmk-config/tree/addview)

3. 增加红点鼠标。[trackpoint分支](https://github.com/thinkahead123/lily58-zmk-config/tree/trackpoint)

## 修改方式

## 修改方式(未完成)

1. 改造成为无线。
   相对来说比较简单，主要涉及到
     * 使用带蓝牙的nice!nano的替代品(淘宝搜索: Promicro NRF52840开发板)
     * 电池需要焊接到B+/RAW和B-/GND，如果你不清楚什么意思，查看相关芯片手册。
     实际使用感受，因为zmk基于嵌入式系统zephyr，实测能耗极低，蓝牙开关用处不大。
     除此之外，网上有[电池背包](https://github.com/hazels-garage/battpack)的方案，看上去不错。我没有实验过。
     * 由于本人使用了ps/2的电池，故修改外壳3d模型，以放下电池。

2. 增加小屏幕。

3. 增加红点鼠标。
1

  

## 参考

### 原始主体网站  

1. https://github.com/kata0510/Lily58/tree/master  主体网站
  

### 增加trackpoint：

1. https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver?tab=readme-ov-file#12-automatic-layer-toggling-on-mouse-movement  核心原理

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