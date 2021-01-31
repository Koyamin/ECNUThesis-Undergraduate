# ECNUThesis-Undergraduate

### 华东师范大学本科生学士学位论文模版

本模版重构了[袁轶君](https://github.com/YijunYuan)的[ECNU-Undergraduate-LaTeX](https://github.com/YijunYuan/ECNU-Undergraduate-LaTeX)，
并将个人信息的填写、个性化设置、命令、环境等进行了一定的封装，让使用者可以更加方便地使用LaTeX进行创作。

### 使用环境

本模版只能使用 XeLaTeX 进行编译，使用其它 LaTeX 引擎将会导致编译失败。所以请使用最新版的 TeX Live 进行编译，而不是使用老旧的 CTeX 套装。

### 编译方法

假设 TeX 源文件为 `thesis.tex`，请在命令行中执行
```
latexmk -xelatex thesis
```
以编译。

### 使用方法

#### 导入文档类

在导言区导入文档类
```
\documentclass{ecnuthesis}
```
文档类模版可以设置选项。
- `printMode`：是否开启打印模式(开启打印模式适合双面打印，关闭打印模式适合提交电子版), 若缺省则为关闭, 反之则为开启。

#### 参数设置

在导入文档类后输入
```
\ecnuSetup {
  ...
}
```
即可进行参数设置。

允许采用两种方式设置选项：
- `style/... = ...`；
- `style/... = ...`。


### 不足与改进

本模版仍有一些不足与值得改进之处。已知的不足如下所示。

- 页眉的年级不能进行修改；
- 尾注功能未实现。
- ……
