# ECNUThesis-Undergraduate

[![](https://img.shields.io/badge/Overleaf-ECNUthesis-brightgreen.svg)](https://www.overleaf.com/latex/templates/ecnuthesis-latex-thesis-template-for-east-china-normal-university/szppdtkvgvpk)

### 华东师范大学本科生学士学位论文模版

本模版使用 LaTeX3 重构了 [YijunYuan](https://github.com/YijunYuan) 的 [ECNU-Undergraduate-LaTeX](https://github.com/YijunYuan/ECNU-Undergraduate-LaTeX)，
并将个人信息的填写、个性化设置、命令、环境等进行了一定的封装，让使用者可以更加方便地使用 LaTeX 进行创作。

## 使用环境

本模版只能使用 XeLaTeX 进行编译，使用其它 LaTeX 引擎将会导致编译失败。所以请安装最新版的 TeX Live ，并使用 XeLaTeX 进行编译。

若您的个人计算机中仍安装了老旧的 CTeX 套装，请毫不犹豫地卸载它，并安装最新版的 TeX Live。

## 编译方法

假设 TeX 源文件为 `thesis.tex`，请在命令行中执行
```
latexmk -xelatex thesis
```
以编译。

## 使用方法

### 导入文档类

在导言区导入文档类
```
\documentclass{ecnuthesis}
```
文档类模版可以设置选项。
- `printMode`：是否开启打印模式(开启打印模式适合双面打印，关闭打印模式适合提交电子版), 若缺省则为关闭, 反之则为开启。

### 参数设置

在导入文档类后输入
```
\ecnuSetup {
  ...
}
```
即可进行参数设置。

允许采用两种方式设置选项：
- `style/... = ...`；
- `style = { ... = ... } `。

注意事项: 
1. 请勿在参数设置中出现空行；
2. `=` 两侧的空格将被忽略；
3. `/` 两侧的空格不会被忽略；
4. 请使用英文逗号 `,` 分隔选项。

#### `info`类的设置

`info` 类用于输入论文信息。具体的设置选项如下所示。

- `title = {...}` 表示中文标题；
- `titleEN = {...}` 表示英文标题；
- `author = {...}` 表示作者姓名；
- `studentID = {...}` 表示作者学号；
- `department = {...}` 表示学院名称；
- `major = {...}` 表示专业名称；
- `supervisor = {...}` 表示指导教师姓名；
- `academicTitle = {...}` 表示指导教师职称；
- `year  = ...` 表示论文完成年份，若省略则调用当前年份 (注意没有花括号)；
- `month = ...` 表示论文完成月份，若省略则调用当前月份 (注意没有花括号)；
- `keywords = {..., ..., ..., ...}` 表示中文关键词，请使用英文逗号 "," 以分隔；
- `keywordsEN = {..., ..., ..., ...}` 表示英文关键词，请使用英文逗号 "," 以分隔。

#### `style`类的设置

`style` 类用于简单设置论文格式。具体的设置选项如下所示。

- `footnote  = plain|circled` 表示脚注编号样式。
    
    可用选项为 `footnote = plain|circled`。

    - `plain`表示脚注的编号仅为数字，
    - `circled`表示脚注的编号为带圆圈数字 (仅限1-10)。
    
    (默认选项为 `plain` )

- `numbering = arabic|alpha|chinese` 表示章节编号样式。
    
    可用选项为 `numbering = arabic|alpha|chinese`。
    
    -  `arabic`    使用数字进行编号 (即理科要求)，
    -  `alpha`     使用字母进行编号 (即外文要求)，
    -  `chinese`   使用汉字进行编号 (即文科要求)，
    
    (默认选项为 `arabic` )

- `fontCJK = fandol|windows|mac` 表示中文字体选择
    
    可用选项为 `fontCJK = fandol|windows|mac`。

    - `fandol`    使用 TeX 自带的开源 fandol 字体
    - `windows`   使用 Windows 系统内的字体 (中易)
    - `mac`       使用 MacOS 系统内的字体
    
    (默认选项为 `fandol` )

- `bibResource = {...}` 表示参考文献数据源。
    
    由于参考文献处理使用的是 biber + biblatex , 所以必须明确给出 `.bib` 后缀名

- `logoResource = {...}` 表示封面插图数据源
    
    模版已自带，位于`./source/inner-cover(contains_font).eps`。
    
    (默认选项为空)

## 不足与改进

本模版仍有一些不足与值得改进之处。已知的不足如下所示。

- 尾注功能未实现；
- ……

## 参考

- Kunth D E. 的 The TeXBook: Computers & Typesetting.
- CTEX.ORG 的 CTeX 宏集手册
- CTEX.ORG 的 xeCJK 宏包
- The LaTeX3 Project 的 The LaTeX3 Sources
- [stone-zeng](https://github.com/stone-zeng) 的 [fduthesis](https://github.com/stone-zeng/fduthesis)
- [YijunYuan](https://github.com/YijunYuan) 的 [ECNU-Undergraduate-LaTeX](https://github.com/YijunYuan/ECNU-Undergraduate-LaTeX)

## 软件许可证

华东师范大学校徽图案 (`inner-cover(contains_font).eps`) 版权归华东师范大学所有。

其他部分使用 LPPL 授权。