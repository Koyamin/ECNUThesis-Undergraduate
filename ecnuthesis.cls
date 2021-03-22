\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: ecnuthesis.cls 0.1 2021-01-31 12:00:00Z Koyamin <koyafumin@gmail.com> $
  {Undergraduate Thesis Template for East China Normal University}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xparse, xtemplate, l3keys2e }
% 编译器只能选为 XeTeX
\msg_new:nnn { ecnuthesis } { engine-unsupportd } 
  { \\
    This~ class~ requires~ XeTeX~ to~ compile. \\
    The~ engine~ "#1"~ is~ not~ supported. 
  }
\sys_if_engine_xetex:F
  {
    \msg_fatal:nnx { ecnuthesis } { engine-unsupportd } { \c_sys_engine_str }
  }
\cs_new:Npn \__ecnu_msg_new:nn  { \msg_new:nnn      { ecnuthesis } }
\cs_new:Npn \__ecnu_error:n     { \msg_error:nn     { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nn    { \msg_error:nnn    { ecnuthesis } }

% 设置选项
\bool_new:N \g__ecnu_twoside_bool
\bool_set_false:N \g__ecnu_twoside_bool
\clist_new:N \g__ecnu_to_ctexart_clist
\__ecnu_msg_new:nn { unknown-option }
  { The~ class~ option~ "\l_keys_key_tl"~ is~ unknown. }
\keys_define:nn { ecnu / option }
  {
    printMode   .choice:,
    printMode / true  .code:n = 
      {
        \clist_gput_right:Nn \g__ecnu_to_ctexart_clist { twoside }
        \bool_set_true:N     \g__ecnu_twoside_bool
      },
      printMode / false .code:n = 
      {
        \clist_gput_right:Nn \g__ecnu_to_ctexart_clist { oneside }
        \bool_set_false:N    \g__ecnu_twoside_bool
      },
    printMode   .default:n = true,
    printMode   .initial:n = false,
    unknown .code:n = { \__ecnu_error:n { unknown-option } }
  }
\ProcessKeysOptions { ecnu / option }
% 导入 ctex 文档类
\PassOptionsToClass
  {
    UTF8,
    heading     = true,
    zihao       = -4,
    fontset     = none,
    linespread  = 1.5,
    \g__ecnu_to_ctexart_clist,
  }
  { ctexrep }
\clist_map_inline:nn
  {
    { no-math           } { fontspec     },
    { perpage           } { footmisc     },
    { mathrm=sym        } { unicode-math },
  }
  { \PassOptionsToPackage #1 }
\RequirePackage { etoolbox }
\LoadClass { ctexrep }
% 导入宏包
\PassOptionsToPackage { titles } { tocloft }
\PassOptionsToPackage { hidelinks } { hyperref }
\RequirePackage
  {
    geometry,
    fontspec,
    amsmath,
    amssymb,
    unicode-math,
    xcolor,
    footmisc,
    listings,
    caption,
    graphicx,
    fancyhdr,
    enumitem, 
    amsthm,
    thmtools,
    xeCJKfntef,
    tocloft,
    hyperref,
  }
\geometry
  {
    % showframe,
    a4paper,
    top       = 2.5 cm, 
    bottom    = 2.0 cm, 
    footskip  = 0.7 cm,
  }
\bool_if:NTF \g__ecnu_twoside_bool 
  {
    \geometry 
      {
        left      = 3.0 cm, 
        right     = 2.5 cm,
      } 
  }
  {
    \geometry 
      {
        left      = 3.0 cm, 
        right     = 2.5 cm,
      } 
  }

\cs_new_protected:Npn \__ecnu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new:Npn \ecnu_allow_url_break:
  {
    \cs_new:Npn \__ecnu_add_url_break_points:
      { \tl_map_function:NN \c__ecnu_url_break_points_tl \do }
    \__ecnu_appto_cmd:Nn \UrlBreaks
      { \UrlOrds \__ecnu_add_url_break_points: }
  }
\tl_const:Nn \c__ecnu_url_break_points_tl
  {
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    0123456789
  }
\ctex_at_end_preamble:n {\ecnu_allow_url_break:}
% 论文基本信息
\clist_map_inline:nn 
  { 
    title, titleEN, author, studentID, department, major, supervisor
    academicTitle
  }
  { \tl_new:c { l__ecnu_info_ #1 _tl } }
\int_new:N   \l__ecnu_info_year_int
\int_zero:N  \l__ecnu_info_year_int
\int_new:N   \l__ecnu_enroll_year_int
\int_new:N   \l__ecnu_info_month_int
\int_zero:N  \l__ecnu_info_month_int
\clist_new:N \l__ecnu_info_keywords_clist
\clist_new:N \l__ecnu_info_keywordsEN_clist
\keys_define:nn { ecnu / info }
  {
    title           .tl_set:N     = \l__ecnu_info_title_tl,
    titleEN         .tl_set:N     = \l__ecnu_info_titleEN_tl,
    author          .tl_set:N     = \l__ecnu_info_author_tl,
    studentID       .tl_set:N     = \l__ecnu_info_studentID_tl,
    department      .tl_set:N     = \l__ecnu_info_department_tl,
    major           .tl_set:N     = \l__ecnu_info_major_tl,
    supervisor      .tl_set:N     = \l__ecnu_info_supervisor_tl,
    academicTitle   .tl_set:N     = \l__ecnu_info_academicTitle_tl,
    year            .int_set:N    = \l__ecnu_info_year_int,
    month           .int_set:N    = \l__ecnu_info_month_int,
    keywords        .clist_set:N  = \l__ecnu_info_keywords_clist,
    keywordsEN      .clist_set:N  = \l__ecnu_info_keywordsEN_clist
  }
\int_compare:nNnTF { \l__ecnu_info_year_int } = { \c_zero_int } 
  { \int_set_eq:NN \l__ecnu_info_year_int \c_sys_year_int } 
  { }
\int_compare:nNnTF { \l__ecnu_info_month_int } = { \c_zero_int } 
  {
    \int_set_eq:NN \l__ecnu_info_month_int \c_sys_month_int
    \NewDocumentCommand \themonth { } 
      { \int_use:N \l__ecnu_info_month_int } 
  } 
  { \NewDocumentCommand \themonth { } { \int_use:N \c_sys_month_int } }
\NewDocumentCommand \theyear { } { \int_to_arabic:n {\l__ecnu_info_year_int} }
\NewDocumentCommand \enrollYear { } 
  { 
    \int_set:Nn \l__ecnu_enroll_year_int {\l__ecnu_info_year_int - 4 }
    \int_use:N  \l__ecnu_enroll_year_int
  }
\pagestyle{fancy}
  \fancyhead[L,R]       { }
  \fancyhead[C]         { \small 华东师范大学 \enrollYear 级本科毕业论文/设计 }
  \fancyfoot[C]         { \small \thepage }
  \fancyfoot[L,R]       { }
  \headheight = 13 pt
\fancypagestyle{plain} 
  {
    \fancyhead[L,R]     { }
    \fancyhead[C]       { \small 华东师范大学 \enrollYear 级本科毕业论文/设计 }
    \fancyfoot[C]       { \small \thepage }
    \fancyfoot[L,R]     { }
    \headheight = 13 pt
  }
% 字体设置
\tl_new:N \g__ecnu_cjk_fontset_tl
\tl_new:N \g__ecnu_math_fontset_tl
\keys_define:nn { ecnu / style }
  {
    fontCJK .choices:nn =
      { fandol, mac, windows }
      { \tl_set_eq:NN \g__ecnu_cjk_fontset_tl \l_keys_choice_tl },
    fontMath .choices:nn =
      { lm, times }
      { \tl_set_eq:NN \g__ecnu_math_fontset_tl \l_keys_choice_tl }
  }
\cs_new_protected:Npn \__ecnu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setmathfont:nn #1#2
  { \__um_setmathfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKmainfont:nn #1#2
  { \__ecnu_set_family:nnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKsansfont:nn #1#2
  { \__ecnu_set_family:nnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKmonofont:nn #1#2
  { \__ecnu_set_family:nnn { \CJKttdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_set_cjk_font_kai:nn #1#2
  { \__ecnu_set_family:nnn { ecnu@kai } {#2} {#1} }
\cs_new_protected:Npn \ecnu@kai
  { \__ecnu_switch_family:n { ecnu@kai } }
\tl_const:Nn \__ecnu_cjk_font_options:
  { UprightFont = *, ItalicFont = *, AutoFakeBold = true }
\cs_new_protected:Npx \__ecnu_setCJKmainfont:n   #1
  { \__ecnu_setCJKmainfont:nn   {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npx \__ecnu_setCJKsansfont:n   #1
  { \__ecnu_setCJKsansfont:nn   {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npx \__ecnu_setCJKmonofont:n   #1
  { \__ecnu_setCJKmonofont:nn   {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npx \__ecnu_set_cjk_font_kai:n #1
  { \__ecnu_set_cjk_font_kai:nn {#1} { \__ecnu_cjk_font_options: } }
\cs_new_eq:NN \__ecnu_set_family:nnn  \xeCJK_set_family:nnn
\cs_new_eq:NN \__ecnu_switch_family:n \xeCJK_switch_family:n
\tl_new:N \g__ecnu_font_family_xits_tl
\tl_new:N \g__ecnu_font_style_xits_rm_tl
\tl_new:N \g__ecnu_font_style_xits_bf_tl
\tl_new:N \g__ecnu_font_style_xits_it_tl
\tl_new:N \g__ecnu_font_style_xits_bfit_tl
\tl_new:N \g__ecnu_font_name_xits_tl
\tl_new:N \g__ecnu_font_name_xits_math_rm_tl
\tl_new:N \g__ecnu_font_name_xits_math_bf_tl
\fontspec_font_if_exist:nTF { XITS-Regular.otf }
  {
    \tl_set:Nn \g__ecnu_font_family_xits_tl        { XITS             }
    \tl_set:Nn \g__ecnu_font_style_xits_rm_tl      { Regular          }
    \tl_set:Nn \g__ecnu_font_style_xits_bf_tl      { Bold             }
    \tl_set:Nn \g__ecnu_font_style_xits_it_tl      { Italic           }
    \tl_set:Nn \g__ecnu_font_style_xits_bfit_tl    { BoldItalic       }
    \tl_set:Nn \g__ecnu_font_name_xits_math_rm_tl  { XITSMath-Regular }
    \tl_set:Nn \g__ecnu_font_name_xits_math_bf_tl  { XITSMath-Bold    }
  }
  {
    \tl_set:Nn \g__ecnu_font_family_xits_tl        { xits          }
    \tl_set:Nn \g__ecnu_font_style_xits_rm_tl      { regular       }
    \tl_set:Nn \g__ecnu_font_style_xits_bf_tl      { bold          }
    \tl_set:Nn \g__ecnu_font_style_xits_it_tl      { italic        }
    \tl_set:Nn \g__ecnu_font_style_xits_bfit_tl    { bolditalic    }
    \tl_set:Nn \g__ecnu_font_name_xits_math_rm_tl  { xits-math     }
    \tl_set:Nn \g__ecnu_font_name_xits_math_bf_tl  { xits-mathbold }
  }
\tl_set:Nx \g__ecnu_font_name_xits_tl
  { \g__ecnu_font_family_xits_tl - \g__ecnu_font_style_xits_rm_tl }
\fontspec_font_if_exist:nTF { Times~ New~ Roman } 
  {
    \cs_new_protected:Npn \__ecnu_load_fontEN:
      {
        \__ecnu_setmainfont:nn { Times~ New~ Roman    } { }
        \__ecnu_setsansfont:nn { Arial                } { }
        \__ecnu_setmonofont:nn { Courier~ New         } { }
        \__ecnu_setmathfont:nn { \g__ecnu_font_name_xits_math_rm_tl .otf }
        { BoldFont = \g__ecnu_font_name_xits_math_bf_tl .otf }
      }
  }
  { 
    \cs_new_protected:Npn \__ecnu_load_fontEN:
      {
        \__ecnu_setmainfont:nn { \g__ecnu_font_family_xits_tl }
          {
            Extension      = .otf,
            UprightFont    = *-\g__ecnu_font_style_xits_rm_tl,
            BoldFont       = *-\g__ecnu_font_style_xits_bf_tl,
            ItalicFont     = *-\g__ecnu_font_style_xits_it_tl,
            BoldItalicFont = *-\g__ecnu_font_style_xits_bfit_tl
          }
        \__ecnu_setsansfont:nn { texgyreheros }
          {
            Extension      = .otf,
            UprightFont    = *-regular,
            BoldFont       = *-bold,
            ItalicFont     = *-italic,
            BoldItalicFont = *-bolditalic
          }
        \__ecnu_setmonofont:nn { texgyrecursor }
          {
            Extension      = .otf,
            UprightFont    = *-regular,
            BoldFont       = *-bold,
            ItalicFont     = *-italic,
            BoldItalicFont = *-bolditalic,
            Ligatures      = CommonOff
          }
        
      }
  }
\cs_new_protected:Npn \__ecnu_load_math_font_lm:
  { \__ecnu_setmathfont:nn { latinmodern-math.otf } { } }
\cs_new_protected:Npn \__ecnu_load_math_font_times:
  {
    \__ecnu_setmathfont:nn { \g__ecnu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__ecnu_font_name_xits_math_bf_tl .otf }
  }
\cs_new_protected:Npn \__ecnu_load_cjk_font_fandol:
  {
    \__ecnu_setCJKmainfont:nn   { FandolSong }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__ecnu_setCJKsansfont:nn   { FandolHei  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__ecnu_setCJKmonofont:nn   { FandolFang }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
    \__ecnu_set_cjk_font_kai:nn { FandolKai  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
  }
\cs_new_protected:Npn \__ecnu_load_cjk_font_mac:
  {
    \__ecnu_setCJKmainfont:nn   { STSongti-SC }
      {
        UprightFont    = *-Light,
        BoldFont       = *-Bold,
        ItalicFont     = *-Light,
        BoldItalicFont = *-Bold
      }
    \__ecnu_setCJKsansfont:nn   { STHeitiSC   }
      {
        UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium
      }
    \__ecnu_setCJKmonofont:n    { STFangsong  }
    \__ecnu_set_cjk_font_kai:nn { STKaitiSC   }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__xeCJK_preamble_family:n { \CJKrmdefault }
    \__xeCJK_preamble_family:n { \CJKsfdefault }
    \__xeCJK_preamble_family:n { \CJKttdefault }
  }
\cs_new_protected:Npn \__ecnu_load_cjk_font_windows:
  {
    \__ecnu_setCJKmainfont:n   { SimSun   }
    \__ecnu_setCJKsansfont:n   { SimHei   }
    \__ecnu_setCJKmonofont:n   { FangSong }
    \__ecnu_set_cjk_font_kai:n { KaiTi    }
  }
\cs_new_protected:Npn \__ecnu_load_font: 
  { 
    \__ecnu_load_fontEN: 
    \use:c { __ecnu_load_math_font_ \g__ecnu_math_fontset_tl : }
    \use:c { __ecnu_load_cjk_font_ \g__ecnu_cjk_fontset_tl : }
  }
\ctex_at_end_preamble:n { \__ecnu_load_font: }

% 脚注编号样式
\tl_const:Nn \c__ecnu_fn_style_plain_tl    { plain   }
\tl_const:Nn \c__ecnu_fn_style_circled_tl  { circled }
\tl_new:N \l__ecnu_fn_style_tl
\keys_define:nn { ecnu / style }
  {
    footnote   .choices:nn =
      {plain, circled}
      {
        \tl_gset_eq:NN \l__ecnu_fn_style_tl \l_keys_choice_tl
      },
    footnote .value_required:n = true
  }
\cs_new:Npn \__ecnu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new:Npn \__ecnu_fn_symbol_xits:n #1
  {
    \int_compare:nTF { #1 >= 10 }
      {
        \int_compare:nTF { #1 >= 36 }
          { \__ecnu_symbol:n { \int_eval:n { "24B6 - 36 + #1 } } }
          { \__ecnu_symbol:n { \int_eval:n { "24D0 - 10 + #1 } } }
      }
      { \__ecnu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_set:Npn \thefootnote { \ecnu_footnote_number:N \c@footnote }
\cs_new:Npn \ecnu_footnote_number:N #1
  {
    \tl_case:NnF \l__ecnu_fn_style_tl 
      {
        \c__ecnu_fn_style_plain_tl
          { \int_use:N #1 }
          \c__ecnu_fn_style_circled_tl
          { 
            \fontspec { \g__ecnu_font_name_xits_tl .otf }
            \__ecnu_fn_symbol_xits:n {#1}
          }
      }
      { \int_use:N #1 }
  }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
  }

% 代码块设置
\definecolor { colorKeyword     } { RGB } {  86,156,214 }
\definecolor { colorString      } { RGB } { 214,157,133 }
\definecolor { colorComment     } { RGB } {  87,166, 74 }
\definecolor { colorNumber      } { RGB } { 128,128,128 }
\definecolor { colorEmph        } { RGB } {  78,201,176 }
\definecolor { colorBackground  } { RGB } { 242,242,242 }
\definecolor { colorRule        } { RGB } { 177,  0, 52 }
\lstdefinestyle{style@base}
{
    basewidth         = 0.6 em,
    lineskip          = 2 pt,
    frame             = l,
    framerule         = 2 pt,
    framesep          = 5 pt,
    xleftmargin       = 7 pt,
    basicstyle        = \small\ttfamily,
    rulecolor         = \color{colorRule},
    backgroundcolor   = \color{colorBackground},
    breaklines        = true,
    showspaces        = false,
    showstringspaces  = false,
}
\lstset
  {
    style = style@base,
  }
\RenewDocumentCommand \lstlistingname { } {源代码}

% 图表名称格式
\captionsetup
  {
    font     = small,
    labelsep = quad
  }

% 章节标号
\setcounter{secnumdepth}{5}
\__ecnu_msg_new:nn { unknown-value }
  { The~ value~ "\l_keys_value_tl"~ is~ unknown. }
\keys_define:nn { ecnu / style }
  {
    numbering   .choice:,
    numbering / arabic  .code:n = 
      {
        \keys_set:nn { ctex }
          {
            chapter = {
              name    = {,、},
              number  = \arabic{chapter},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
              aftername  = \ ,
            },
            section = {
              name = {,},
              number  = {\arabic{chapter}.\arabic{section}},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            },
            subsection = {
              name    = {,},
              number  = 
                {\arabic{chapter}.\arabic{section}.\arabic{subsection}},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            }, 
            subsubsection = {
              name    = {,},
              number  = 
                {
                  \arabic{chapter}.\arabic{section}.
                  \arabic{subsection}.\arabic{subsubsection}
                },
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            }, 
            paragraph = {
              name    = {,)},
              number  = \arabic{paragraph},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            },
          }
      },
    numbering / chinese .code:n = 
      {
        \keys_set:nn { ctex }
          {
            chapter = {
              name    = {,、},
              number  = \chinese{chapter},
              format  = \sffamily\zihao{-4},
              aftername  = \ ,
            },
            section = {
              name    = {（,）},
              number  = \chinese{section},
              format  = \sffamily\zihao{-4},
              aftername  = \ ,
            }, 
            subsection = {
              name    = {,.},
              number  = \arabic{subsection},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            }, 
            subsubsection = {
              name    = {(,)},
              number  = \arabic{subsubsection},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            }, 
            paragraph = {
              name    = {,)},
              number  = \arabic{paragraph},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            },
          }
      },
    numbering / alpha   .code:n = 
      {
        \keys_set:nn { ctex }
          {
            chapter = {
              name = {,.},
              number  = \Alph{chapter},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
              aftername  = \quad,
            },
            section = {
              name = {(,)},
              number  = \Alph{section},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            },
            subsection = {
              name    = {,.},
              number  = \alph{subsection},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            }, 
            subsubsection = {
              name    = {(,)},
              number  = \alph{subsubsection},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            }, 
            paragraph = {
              name    = {,)},
              number  = \alph{paragraph},
              format        = ,
              titleformat   = \sffamily\zihao{-4},
              numberformat  = \zihao{-4},
            },
          }
      },
    numbering / unknown   .code:n = { \__ecnu_error:n { unknown-value } }
  }
\keys_set:nn { ctex }
  {
    chapter = { 
      beforeskip    = 0ex,
      afterskip     = 2.5ex plus .2ex,
      fixskip       = true,
    },
    section = { 
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      fixskip       = true,
    },
    subsection = { 
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      indent        = 1 em,
      fixskip       = true,
    },
    subsubsection   = { 
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      indent        = 2 em,
      fixskip       = true,
    },
    paragraph = {
      beforeskip    = 2ex plus 1ex minus .2ex,
      afterskip     = 1em,
      indent        = 3 em,
      fixskip       = true,
    },
  }

% 图片标号
\cs_set:Npn \thefigure
  { \int_to_arabic:n { \c@chapter } - \int_to_arabic:n { \c@figure } }
\cs_set:Npn \thetable
  { \int_to_arabic:n { \c@chapter } - \int_to_arabic:n { \c@table  } }
% 定理环境
\declaretheoremstyle
  [
    spaceabove=6pt, spacebelow=6pt,
    headfont      = \sffamily,
    headpunct     = ,
    notefont      = \mdseries, 
    notebraces    = {(}{)},
    bodyfont      = \normalfont,
    postheadspace = 1em,
  ]
  {mainstyle}
\declaretheoremstyle
  [
    spaceabove=6pt, spacebelow=6pt,
    headfont      = \sffamily,
    headpunct     = ,
    notefont      = \mdseries, 
    notebraces    = {(}{)},
    bodyfont      = \normalfont,
    postheadspace = 1em,
    qed           = \qedsymbol
  ]
  {proofstyle}
\declaretheorem[name=定理,style=mainstyle,numberwithin=chapter] { theorem    }
\declaretheorem[name=引理,style=mainstyle,numberwithin=chapter] { lemma      }
\declaretheorem[name=推论,style=mainstyle,numberwithin=chapter] { corollary  }
\declaretheorem[name=定义,style=mainstyle,numberwithin=chapter] { definition }
\declaretheorem[name=例,style=mainstyle,numberwithin=chapter]   { example    }
\declaretheorem[name=问题,style=mainstyle,numberwithin=chapter] { problem    }
\declaretheorem[name=公理,style=mainstyle,numberwithin=chapter] { axiom      }
\declaretheorem[name=证明,style=proofstyle,numbered=no]         { Proof      }
\RenewDocumentEnvironment {proof} { } { \begin{Proof} } { \end{Proof} }

% 参考文献
\tl_new:N \l__ecnu_bib_resource_tl
\keys_define:nn { ecnu / style }
  {
    bibResource .tl_set:N = \l__ecnu_bib_resource_tl
  }
\PassOptionsToPackage 
  {
    backend   = biber,
    style     = gb7714-2015,
    seconds   = true,
    hyperref  = true,
  } 
  { biblatex }
\RequirePackage { biblatex }
\renewcommand*{\bibfont}{\zihao{5}}
\cs_new_protected:Npn \__ecnu_biblatex_setup:
  {
    \exp_args:NV \addbibresource \l__ecnu_bib_resource_tl
    \__ecnu_biblatex_allow_url_break:
    \defbibheading { bibliography } [ \bibname ] 
    { 
      \phantomsection
      \addcontentsline{toc}{chapter}{参考文献}
      \__ecnu_title:n {##1} 
      \mode_leave_vertical: \par \noindent
    }
  }
\cs_new:Npn \__ecnu_biblatex_allow_url_break:
  {
    \int_set_eq:NN \c@biburlucpenalty  \c_one_int
    \int_set_eq:NN \c@biburlnumpenalty \c_one_int
    \int_set_eq:NN \c@biburllcpenalty  \c_one_int
  }
\ctex_at_end_preamble:n { \__ecnu_biblatex_setup: }
\NewDocumentCommand \PrintReference {} 
  {
    \cleardoublepage
    \printbibliography
    \clearpage{\thispagestyle{empty}\cleardoublepage}
  }

% 制作封面
%% 定义内部函数
\cs_new_protected:Npn \__ecnu_vspace:N #1
  {
    \dim_set_eq:NN \l__ecnu_tmpa_dim \prevdepth
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \prevdepth \l__ecnu_tmpa_dim
  }
\cs_new_protected:Npn \__ecnu_vspace:n #1
  {
    \skip_set:Nn \l__ecnu_tmpa_skip {#1}
    \__ecnu_vspace:N \l__ecnu_tmpa_skip
  }
\cs_generate_variant:Nn \__ecnu_vspace:N { c }
\box_new:N   \l__ecnu_tmpa_box
\clist_new:N \l__ecnu_tmpa_clist
\clist_new:N \l__ecnu_tmpb_clist
\skip_new:N  \l__ecnu_tmpa_skip
\tl_new:N    \l__ecnu_tmpa_tl
\tl_new:N    \l__ecnu_tmpb_tl
\dim_new:N   \l__ecnu_tmpa_dim
\dim_new:N   \l__ecnu_tmpb_dim
\cs_new_protected:Npn \__ecnu_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1}
      { \tl_map_inline:xn {#2} { ##1 \hfil } \unskip }
  }
\cs_new_protected:Npn \__ecnu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__ecnu_center_box:nn  { Vn }
\cs_new:Npn \__ecnu_fixed_width_box:nn #1#2
  { \parbox {#1} {#2} }
\cs_new:Npn \__ecnu_fixed_width_center_box:nn #1#2
  { \parbox {#1} { \centering #2 } }
\cs_new:Npn \__ecnu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__ecnu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__ecnu_tmpa_box }
  }
\cs_generate_variant:Nn \__ecnu_get_text_width:Nn { NV }
\tl_new:N \l__ecnu_header_center_mark_tl
\cs_new_protected:Npn \__ecnu_chapter:n #1
  {
    \group_begin:
      \ctexset { chapter / numbering = false }
      \chapter* {#1}
    \group_end:
  }
\cs_new_protected:Npn \__ecnu_title:n #1
  {
    \group_begin:
      \ctexset 
        { 
          chapter / numbering = false,
          chapter / format    = \sffamily\centering,
          chapter / titleformat = \zihao{-3},
        }
      \chapter* {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__ecnu_chapter:n { V }
\cs_generate_variant:Nn \__ecnu_title:n { V }
\cs_new:Npn \__ecnu_blank_underline:n #1
  { \rule [ -0.5 ex ] {#1} { 0.4 pt } }
\cs_new:Npn \__ecnu_line_spread:N #1
  { \linespread { \fp_use:N #1 } \selectfont }
\cs_new:Npn \__ecnu_line_spread:n #1
  { \linespread {#1} \selectfont }
\tl_const:Nn \c__ecnu_info_name_tl          { 姓名      }
\tl_const:Nn \c__ecnu_info_studentID_tl     { 学号      }
\tl_const:Nn \c__ecnu_info_department_tl    { 学院      }
\tl_const:Nn \c__ecnu_info_major_tl         { 专业      }
\tl_const:Nn \c__ecnu_info_supervisor_tl    { 指导教师   }
\tl_const:Nn \c__ecnu_info_academicTitle_tl { 职称      }
\tl_const:Nn \c__ecnu_schoolNum_tl          { 学校代码   }
\tl_const:Nn \c__ecnu_colon_tl              { ： }
\tl_const:Nn \c__ecnu_year_tl               { 年 }
\tl_const:Nn \c__ecnu_month_tl              { 月 }
\tl_const:Nn \c__ecnu_thesisInfo_tl         { 届本科生学士学位论文 }
%% 封面各部件的封装
\cs_new_protected:Npn \__ecnu_cover_info:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering \zihao { 4 }
      \clist_set:Nx \l__ecnu_tmpa_clist
        {
          \c__ecnu_info_name_tl,
          \c__ecnu_info_studentID_tl,
          \c__ecnu_info_department_tl,
          \c__ecnu_info_major_tl,
          \c__ecnu_info_supervisor_tl,
          \c__ecnu_info_academicTitle_tl
        }
      \clist_set:Nx \l__ecnu_tmpb_clist
        {
          { \l__ecnu_info_author_tl        },
          { \l__ecnu_info_studentID_tl     },
          { \l__ecnu_info_department_tl    },
          { \l__ecnu_info_major_tl         },
          { \l__ecnu_info_supervisor_tl    },
          { \l__ecnu_info_academicTitle_tl }
        }
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__ecnu_tmpa_clist }
        {
          \bfseries
          \clist_pop:NN \l__ecnu_tmpa_clist \l__ecnu_tmpa_tl
          \clist_pop:NN \l__ecnu_tmpb_clist \l__ecnu_tmpb_tl
          \__ecnu_spread_box:nn { 4 em } { \l__ecnu_tmpa_tl }
          \c__ecnu_colon_tl
          \underline{\__ecnu_center_box:nn { 6 cm } { \l__ecnu_tmpb_tl }}
          \skip_vertical:n { 1 ex }
        }
      \skip_vertical:n { 1 em }
      \theyear  \c__ecnu_year_tl
      \themonth \c__ecnu_month_tl
      \skip_vertical:n { 1 ex }
    \end{minipage}
  }
\cs_new_protected:Npn \__ecnu_cover_id:
  {
    \__ecnu_fixed_width_box:nn { \textwidth }
      {
        \bfseries\zihao { 4 }
        \theyear \c__ecnu_thesisInfo_tl \hfill
        \c__ecnu_schoolNum_tl \c__ecnu_colon_tl \underline{10269}
      }
  }
%% logo图导入接口
\tl_new:N \l__ecnu_logo_resource_tl
\keys_define:nn { ecnu / style }
  {
    logoResource .tl_set:N = \l__ecnu_logo_resource_tl
  }

\cs_new_protected:Npn \__ecnu_cover_logo:
  { 
    \tl_if_empty:NF \l__ecnu_logo_resource_tl
      {
        \begin{minipage} [ c ] { \textwidth }
          \centering
          \includegraphics{\l__ecnu_logo_resource_tl}
        \end{minipage}
      }
  }
% 封面接口
\tl_new:N \l__ecnu_cover_template_tl
\DeclareObjectType { ecnu / cover } { \c_zero_int }
\cs_new_protected:Npn \__ecnu_cover_declare_template_interface:nn #1#2
  { \DeclareTemplateInterface { ecnu / cover } {#1} { \c_zero_int } {#2} }
\cs_new_protected:Npn \__ecnu_cover_declare_template_code:nnn #1#2#3
  { \DeclareTemplateCode { ecnu / cover } {#1} { \c_zero_int } {#2} {#3} }
\cs_generate_variant:Nn \__ecnu_cover_declare_template_interface:nn { nx  }
\cs_generate_variant:Nn \__ecnu_cover_declare_template_code:nnn     { nxn }
\cs_new:Npn \__ecnu_cover_key_type:n #1
  {
    #1 / content     : tokenlist,
    #1 / format      : tokenlist,
    #1 / bottom-skip : skip,
    #1 / align       : choice { left, right, center, normal } = normal,
  }
\cs_new:Npn \__ecnu_cover_key_binding:n #1
  {
    #1 / content     =
      \exp_not:c
        { l__ecnu_cover / \l__ecnu_cover_template_tl / #1 / content_tl  },
    #1 / format      =
      \exp_not:c
        { l__ecnu_cover / \l__ecnu_cover_template_tl / #1 / format_tl   },
    #1 / bottom-skip =
      \exp_not:c
        { l__ecnu_cover / \l__ecnu_cover_template_tl / #1 / bottom_skip },
    #1 / align       =
      {
        left   =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \flushleft ##1 \endflushleft
                  \group_end:
                }
            },
        right  =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \flushright ##1 \endflushright
                  \group_end:
                }
            },
        center =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \center ##1 \endcenter
                  \group_end:
                }
            },
        normal =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            { \exp_not:n { \group_begin: ##1 \group_end: } }
      },
  }
\cs_new_protected:Npn \ecnu_cover_declare_template:nn #1#2
  {
    \tl_set:Nn \l__ecnu_cover_template_tl {#1}
    \__ecnu_cover_declare_template_interface:nx {#1}
      {
        format      : tokenlist,
        top-skip    : skip,
        bottom-skip : skip,
        \clist_map_function:nN {#2} \__ecnu_cover_key_type:n
      }
    \tl_new:c   { l__ecnu_cover / #1 / format_tl   }
    \skip_new:c { l__ecnu_cover / #1 / top_skip    }
    \skip_new:c { l__ecnu_cover / #1 / bottom_skip }
    \clist_map_inline:nn {#2}
      {
        \tl_new:c   { l__ecnu_cover / #1 / ##1 / content_tl  }
        \tl_new:c   { l__ecnu_cover / #1 / ##1 / format_tl   }
        \skip_new:c { l__ecnu_cover / #1 / ##1 / bottom_skip }
      }
    \__ecnu_cover_declare_template_code:nxn {#1}
      {
        format      = \exp_not:c { l__ecnu_cover / #1 / format_tl   },
        top-skip    = \use:c     { l__ecnu_cover / #1 / top_skip    },
        bottom-skip = \use:c     { l__ecnu_cover / #1 / bottom_skip },
        \clist_map_function:nN {#2} \__ecnu_cover_key_binding:n
      }
      {
        \AssignTemplateKeys
        \tl_use:c        { l__ecnu_cover / #1 / format_tl }
        \clist_map_inline:nn {#2}
          { 
            \noindent
            \use:c { __ecnu_cover / #1 / ####1 / align:n }
              {
                \tl_use:c { l__ecnu_cover / #1 / ####1 / format_tl  }
                \tl_use:c { l__ecnu_cover / #1 / ####1 / content_tl }
                \par
              }
            \__ecnu_vspace:c { l__ecnu_cover / #1 / ####1 / bottom_skip }
          }
        \__ecnu_vspace:c { l__ecnu_cover / #1 / bottom_skip }
        \clearpage{\thispagestyle{empty}\cleardoublepage}
      }
  }
\NewDocumentCommand \DeclareCoverTemplate { m m }
  { \ecnu_cover_declare_template:nn {#1} {#2} }
\DeclareCoverTemplate { cover-i   }
  { id, logo, title, titleEN, info }
\renewcommand{\ULthickness}{1pt}
\DeclareInstance { ecnu / cover } { cover-i-default } { cover-i }
  {
    bottom-skip            = 0 pt plus 0.5 fill,
    id       / content     = \__ecnu_cover_id:,
    logo     / content     = \__ecnu_cover_logo:,
    title    / content     =
      \__ecnu_fixed_width_center_box:nn
        { 0.9 \textwidth } 
        { \expandafter\uline\expandafter{\l__ecnu_info_title_tl} },
    titleEN  / content     = 
      \__ecnu_fixed_width_center_box:nn
        { 0.9 \textwidth } 
        { \expandafter\uline\expandafter{\l__ecnu_info_titleEN_tl} },
    info     / content     = \__ecnu_cover_info:,
    title    / format      = \__ecnu_line_spread:n { 1.1 } \zihao { -1 } \bfseries,
    titleEN  / format      = \__ecnu_line_spread:n { 1.1 } \zihao { 2 } \bfseries,
    id       / bottom-skip = 0 pt plus 0.5 fill,
    logo     / bottom-skip = 0 pt plus 0.3 fill,
    titleEN  / bottom-skip = 0 pt plus 2.5 fill,
    id       / align       = right,
    logo     / align       = center,
    title    / align       = center,
    titleEN  / align       = center,
    info     / align       = center,
  }
% 中英文摘要
\tl_const:Nn \c__ecnu_name_abstract_tl    { 摘要 }
\tl_const:Nn \c__ecnu_name_keywords_tl    { 关键词 }
\tl_const:Nn \c__ecnu_name_abstractEN_tl  { Abstract }
\tl_const:Nn \c__ecnu_name_keywordsEN_tl  { Keywords }
\tl_const:Nn \c__ecnu_comma_tl            { , }
\cs_new_protected:Npn \__ecnu_keywords:nNn #1#2#3
  {
    \par \mode_leave_vertical: \par \noindent
    \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim {#1}
    \group_begin: #1 \group_end:
    \parbox [t] { \dim_eval:n { \textwidth - \l__ecnu_tmpa_dim } }
      {
        \clist_use:Nn #2 {#3} \par
        \cs_gset:Npx \__ecnu_keywords_prevdepth: { \dim_use:N \tex_prevdepth:D }
      }
  }
\RenewDocumentEnvironment { abstract } { }
  { \__ecnu_abstract_begin:    } { \__ecnu_abstract_end:      }
\NewDocumentEnvironment { abstractEN  } { }
  { \__ecnu_abstractEN_begin:    } { \__ecnu_abstractEN_end:      }
\cs_new_protected:Npn \__ecnu_abstract_begin:
  { 
    \phantomsection
    \addcontentsline{toc}{chapter}{摘要}
    \__ecnu_title:V \l__ecnu_info_title_tl
    \mode_leave_vertical: \par \noindent
    \zihao{5}
    \group_begin: 
      \sffamily \c__ecnu_name_abstract_tl \c__ecnu_colon_tl
    \group_end:
    \par
  }
\cs_new_protected:Npn \__ecnu_abstractEN_begin:
  { 
    \phantomsection
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \__ecnu_title:V { \rmfamily\bfseries\l__ecnu_info_titleEN_tl }
    \mode_leave_vertical: \par \noindent
    \zihao{5}
    \group_begin: 
      \sffamily \c__ecnu_name_abstractEN_tl \c__ecnu_colon_tl
    \group_end:
    \par
  }
\cs_new_protected:Npn \__ecnu_abstract_end:
  {
    \__ecnu_keywords:nNn
      { \sffamily \c__ecnu_name_keywords_tl \c__ecnu_colon_tl }
      \l__ecnu_info_keywords_clist { ,~ }
    \clearpage{\thispagestyle{empty}\cleardoublepage}
  }
\cs_new_protected:Npn \__ecnu_abstractEN_end:
  {
    \__ecnu_keywords:nNn
      { \sffamily \c__ecnu_name_keywordsEN_tl \c__ecnu_colon_tl }
      \l__ecnu_info_keywordsEN_clist { ,~ }
    \clearpage{\thispagestyle{empty}\cleardoublepage}
  }
% 目录
\tl_const:Nn \c__ecnu_name_toc_tl { 目录 }
\cs_new_protected:Npn \__ecnu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\keys_set:nn { ctex }
  {
    contentsname   = \c__ecnu_name_toc_tl,
  }
\cs_set:Npn \tableofcontents 
  {
    \__ecnu_title:V \contentsname
    \vspace{10pt}
    \@starttoc{toc}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
  }
\renewcommand{\cftchapleader}{\cftdotfill{1.0}}
\renewcommand{\cftsecleader}{\cftdotfill{1.0}}
\renewcommand{\cftsubsecleader}{\cftdotfill{1.0}}
\setlength{\cftbeforechapskip}{0pt}
% 附录
\tl_const:Nn \c__ecnu_name_appendix_tl         { 附录 }
\tl_const:Nn \c__ecnu_name_acknowledgement_tl  { 致谢 }
\RenewDocumentEnvironment { appendix } { }
  { \__ecnu_appendix_begin: } { \__ecnu_appendix_end: }
\cs_new_protected:Npn \__ecnu_appendix_begin:
  { 
    \phantomsection
    \addcontentsline{toc}{chapter}{\c__ecnu_name_appendix_tl}
    \__ecnu_title:V \c__ecnu_name_appendix_tl
    \mode_leave_vertical: \par \noindent
    \zihao{5}
    \par
  }
\cs_new_protected:Npn \__ecnu_appendix_end:
  { \clearpage{\thispagestyle{empty}\cleardoublepage} }
\NewDocumentEnvironment { acknowledgement } { }
  { \__ecnu_acknowledgement_begin: } { \__ecnu_acknowledgement_end: }
\cs_new_protected:Npn \__ecnu_acknowledgement_begin:
  { 
    \phantomsection
    \addcontentsline{toc}{chapter}{\c__ecnu_name_acknowledgement_tl}
    \__ecnu_title:V \c__ecnu_name_acknowledgement_tl
    \mode_leave_vertical: \par \noindent
    \zihao{5}
    \par
  }
\cs_new_protected:Npn \__ecnu_acknowledgement_end:
  { \clearpage{\thispagestyle{empty}\cleardoublepage} }
% 封面命令封装
\NewDocumentCommand \makecoveri { }
  {
    \thispagestyle { empty }
    \UseInstance { ecnu / cover } { cover-i-default }
  }
% 目录命令封装
\NewDocumentCommand \makeTOC { }
  {
    \addtocontents{toc}{\protect\thispagestyle{empty}}
    \tableofcontents
  }

\AtBeginDocument
  {
    \newgeometry
      {
        top     = 2.0 cm, 
        bottom  = 2.0 cm,
        left    = 2.5 cm, 
        right   = 2.5 cm
      }
    \begin{titlepage}
      \makecoveri
    \end{titlepage}
    \restoregeometry
    \makeTOC
  }

\NewDocumentCommand \frontmatter { }
  { \cleardoublepage\pagenumbering{Roman} }
\NewDocumentCommand \mainmatter { }
  { \cleardoublepage\pagenumbering{arabic} }
\NewDocumentCommand \backmatter { }
  { \clearpage{\thispagestyle{empty}\cleardoublepage} }


\keys_set:nn { ecnu / info }
  {
    title           = {(中文标题)},
    titleEN         = {(English Title)},
    author          = {(作者姓名)},
    studentID       = {(学号)},
    department      = {(学院)},
    major           = {(专业)},
    supervisor      = {(导师姓名)},
    academicTitle   = {(导师职称)},
    keywords        = {关键词1, 关键词2, 关键词3},
    keywordsEN      = {keyword1, keyword2, keyword3}
  }
\keys_set:nn { ecnu / style }
  {
    footnote     = plain,
    numbering    = arabic,
    fontCJK      = fandol,
    fontMath     = lm,
    bibResource  = {},
    logoResource = {},
  }

% 提供接口
\keys_define:nn { ecnu }
  {
    info    .meta:nn = { ecnu / info } {#1},
    style   .meta:nn = { ecnu / style } {#1},
  }
\DeclareDocumentCommand \ecnuSetup { m } 
  { \keys_set:nn { ecnu } { #1 } }
%%
%% End of file `ecnuthesis.cls'.