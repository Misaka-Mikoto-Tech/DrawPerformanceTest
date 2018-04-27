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
