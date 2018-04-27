# DrawPerformanceTest
通过使用 GPUInstancing 绘制大量四边形来测试纹理采样和填充性能

## 效果图
![image](Preview/1.png)
![image](Preview/2.png)
![image](Preview/3.png)
![image](Preview/4.png)
![image](Preview/5.png)

#### adreno 630 的 bin layout
![image](Preview/adrenoBin.jpg)

## 部分型号帧率测试结果(反复绘制400次)
### 高通845(1480 * 720)
* 4张1024各采样1次
    * 不透明: `22-23`
    * Clip: `21`
    * 半透明: `25`
* 1张1024采样1次
    * 不透明: `52-53`
    * Clip: `55-56`
    * 半透明: `55`

### 猎户座8890(1280 * 720)
* 4张1024各采样1次
    * 不透明: `60`
    * Clip: `14`
    * 半透明: `14`
* 1张1024采样1次
    * 不透明: `60`
    * Clip: `49`
    * 半透明: `56`

### 华为P9 plus（1920 * 1080）
* 4张1024各采样1次
    * 不透明: `23`
    * Clip: `2.6`
    * 半透明: `2.1`
* 1张1024采样1次
    * 不透明: `17.2`
    * Clip: `7`
    * 半透明: `8.4`

### `现象及分析`
* 总体不透明物体渲染效率比 clip 和 blend 高，但高通GPU反而出现了不透明物体不如半透明性能高的现象，更改渲染前后顺序依然如此，怀疑 adreno GPU 的 Depth Test 和 Depth Write 的性能极其差，甚至抵消了 HSR 带来的优化。
* 半透明渲染华为GPU性能很差，原因可能是华为的 on chip memory 比较小，导致需要依次渲染更多的 Tile
* 增加每个片段着色器内的采样数量时，8890 和华为都表现出了 clip 性能比 blend 高的现象，但高通正好相反，原因不明。
