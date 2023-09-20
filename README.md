# qiaomu-risc-v
64-bit superscalar RISC-V processor. 

# 乔木RISC-V处理器 
乔木处理器是一个开源的64位的超标量RISC-V处理器。

处理器是乱序四发射结构设计，目前支持 RV64I指令集，并且将在未来持续开发。仿真测试通过后，处理器源代码将会陆续开源。

# 处理器架构
 ![乔木架构](https://github.com/ycx122/qiaomu-risc-v/blob/main/picture/cpu.svg)
上图为乔木处理器的基本架构。

|                   处理器配置|       |
|--------------------------|-------|
| Pipeline stage 流水级数      | 10    |
| ALU 计算单元个数               | 4     |
| Decoder width 译码宽度       | 4     |
| LSU 访存单元个数               | 2     |
| ROB 重排序缓冲                | 24    |
| Physical register 物理寄存器  | 32+24 |
| WB pipe 写回通道               |8    |

## 设计目的
研一生活较为清闲，希望完成一些有意思的电路。

## 关于开发者
开发者是来自中国科学院大学集成电路学院的学生。整个处理器由个人完成开发，开发过程艰难，更新较慢，万望见谅。

知乎平台账号：[我爱学习学习爱我](https://www.zhihu.com/people/zhi-zhe-12-60-63)

邮箱 mail ：@youchaoxing23@mails.ucas.ac.cn
