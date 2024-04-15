%%
%% This is file `ecnuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ecnuthesis.dtx  (with options: `class')
%% 
%%     Copyright (C) 2021--2024 by Koyamin <koyafumin@gmail.com>
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. The latest version of this license is in:
%% 
%%       http://www.latex-project.org/lppl.txt
%% 
%%     nd version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: ecnuthesis.dtx 0.2.1 2024-01-20 15:00:00Z Koyamin <koyafumin@gmail.com> Qucheng <i@qcmiao.cn> $
  {Undergraduate Thesis Template for East China Normal University}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
%%

\RequirePackage { xparse, xtemplate, l3keys2e }
\msg_new:nnn { ecnuthesis } { engine-unsupportd }
  { \\
    This~ class~ requires~ XeTeX~ to~ compile. \\
    The~ engine~ "#1"~ is~ not~ supported.
  }
\sys_if_engine_xetex:F
  {
    \msg_fatal:nnx { ecnuthesis } { engine-unsupportd } { \c_sys_engine_str }
  }
\box_new:N   \l__ecnu_tmpa_box
\clist_new:N \l__ecnu_tmpa_clist
\clist_new:N \l__ecnu_tmpb_clist
\skip_new:N  \l__ecnu_tmpa_skip
\tl_new:N    \l__ecnu_tmpa_tl
\tl_new:N    \l__ecnu_tmpb_tl
\dim_new:N   \l__ecnu_tmpa_dim
\dim_new:N   \l__ecnu_tmpb_dim
\bool_new:N \g__ecnu_twoside_bool
\bool_set_false:N \g__ecnu_twoside_bool
\bool_new:N \g__ecnu_decl_page_bool
\bool_set_false:N \g__ecnu_decl_page_bool
\clist_new:N \g__ecnu_to_ctexart_clist
\cs_new:Npn \__ecnu_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__ecnu_qquad: { \skip_horizontal:n { 2 em } }
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
\cs_new:Npn \__ecnu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new:Npn \__ecnu_arabic:n #1
  { \int_to_arabic:v { c@ #1 } }
\cs_new_protected:Npn \__ecnu_gadd_ltxhook:nn #1#2
  { \hook_gput_code:nnn {#1} { . } {#2} }
\hook_gset_rule:nnnn { begindocument/before } { . } { < } { xeCJK }
\cs_new_protected:Npn \__ecnu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__ecnu_preto_cmd:Nn #1#2
  {
    \ctex_preto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__ecnu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new:Npn \__ecnu_msg_new:nn  { \msg_new:nnn      { ecnuthesis } }
\cs_new:Npn \__ecnu_error:n     { \msg_error:nn     { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nn    { \msg_error:nnn    { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nx    { \msg_error:nnx    { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nnn   { \msg_error:nnnn   { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nnnn  { \msg_error:nnnnn  { ecnuthesis } }
\cs_new:Npn \__ecnu_warning:n   { \msg_warning:nn   { ecnuthesis } }
\cs_new:Npn \__ecnu_warning:nn  { \msg_warning:nnn  { ecnuthesis } }
\cs_new:Npn \__ecnu_warning:nxx { \msg_warning:nnxx { ecnuthesis } }
\cs_new:Npn \__ecnu_info:nx     { \msg_info:nnx     { ecnuthesis } }
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
    printMode   .default:n = { true },
    printMode   .initial:n = { false },
    declarePage   .choice:,
    declarePage / true  .code:n =
      {
        \bool_set_true:N    \g__ecnu_decl_page_bool
      },
    declarePage / false  .code:n =
      {
        \bool_set_false:N    \g__ecnu_decl_page_bool
      },
    declarePage   .default:n = { true },
    declarePage   .initial:n = { false },
    unknown .code:n = { \__ecnu_error:n { unknown-option } }
  }
\__ecnu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_str"~ is~ unknown. }
\ProcessKeysOptions { ecnu / option }
\PassOptionsToClass
  {
    UTF8,
    heading     = true,
    zihao       = -4,
    fontset     = none,
    linespread  = 1.625,
    \g__ecnu_to_ctexart_clist,
  }
  { ctexrep }
\clist_map_inline:nn
  {
    { no-math           } { fontspec },
    { perpage           } { footmisc },
  }
  { \PassOptionsToPackage #1 }
\LoadClass { ctexrep }
\RequirePackage
  {
    amsmath,
    unicode-math,
    geometry,
    fancyhdr,
    footmisc,
    graphicx,
    caption,
    bicaption,
    xcolor,
    xeCJKfntef
  }
\geometry
  {
    paper     = a4paper,
    top       = 2.5 cm,
    bottom    = 2.0 cm,
    left      = 3.0 cm,
    right     = 2.5 cm,
    footskip  = 6 mm,
    headsep   = \dimexpr(9.55mm-11.7pt)
  }
\tl_new:N \g__ecnu_cjk_fontset_tl
\tl_new:N \g__ecnu_fontset_tl
\keys_define:nn { ecnu / style }
  {
    font .choices:nn =
      { lm, times, xits }
      { \tl_set_eq:NN \g__ecnu_fontset_tl \l_keys_choice_tl }
  }
\keys_define:nn { ecnu / style }
  {
    fontCJK .choices:nn =
      { fandol, mac, windows }
      { \tl_set_eq:NN \g__ecnu_cjk_fontset_tl \l_keys_choice_tl }
  }
\cs_new_protected:Npn \__ecnu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setmathfont:nn #1#2
  { \__um_setmathfont:nn {#2} {#1} }
\cs_new_eq:NN \__ecnu_set_family:nnn  \xeCJK_set_family:nnn
\cs_new_eq:NN \__ecnu_switch_family:n \xeCJK_switch_family:n
\cs_generate_variant:Nn \__ecnu_set_family:nnn { x }
\cs_new_protected:Npn \__ecnu_setCJKmainfont:nn #1#2
  { \__ecnu_set_family:xnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKsansfont:nn #1#2
  { \__ecnu_set_family:xnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKmonofont:nn #1#2
  { \__ecnu_set_family:xnn { \CJKttdefault } {#2} {#1} }
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
\cs_new_protected:Npn \__ecnu_set_font_helper:n #1
  {
    \exp_args:Nc \RenewDocumentCommand { set #1 font } { O { } m O { } }
      {
        \ctex_at_end_preamble:n
          { \use:c { __ecnu_set #1 font:nn } {##2} { ##1, ##3 } }
      }
  }
\clist_map_inline:nn { main, sans, mono, math }
  { \__ecnu_set_font_helper:n {#1} }
\clist_map_inline:nn { CJKmain, CJKsans, CJKmono }
  { \__ecnu_set_font_helper:n {#1} }
\cs_new_protected:Npn \__ecnu_load_font_times:
  {
    \__ecnu_setmainfont:nn { Times~ New~ Roman    } { }
    \__ecnu_setsansfont:nn { Arial                } { }
    \__ecnu_setmonofont:nn { Courier~ New         } { }
    \__ecnu_setmathfont:nn { XITSMath-Regular.otf }
      { BoldFont = XITSMath-Bold.otf }
  }
\cs_new_protected:Npn \__ecnu_load_font_xits:
  {
    \__ecnu_setmainfont:nn { XITS }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic,
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
    \__ecnu_setmathfont:nn { XITSMath-Regular.otf }
      { BoldFont = XITSMath-Bold.otf }
  }
\cs_new_protected:Npn \__ecnu_load_font_lm:
  { \__ecnu_setmathfont:nn { latinmodern-math.otf } { } }
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
    \use:c { __ecnu_load_font_ \g__ecnu_fontset_tl :         }
    \use:c { __ecnu_load_cjk_font_ \g__ecnu_cjk_fontset_tl : }
  }
\ctex_at_end_preamble:n { \__ecnu_load_font: }
\keys_set:nn { unicode-math }
  {
    math-style = ISO,
    bold-style = ISO,
  }
\DeclareEmphSequence
  {
    \itshape \ecnu@kai,
    \upshape \CJKfamily { \CJKfamilydefault },
  }
\setcounter{secnumdepth}{5}
\keys_set:nn { ctex }
  {
    chapter = {
      format        = \sffamily\normalsize,
      pagestyle     = fancy,
      beforeskip    = 1ex,
      afterskip     = 2.5ex plus .2ex,
      fixskip       = true,
      tocline       = {\CTEXifname{\protect\numberline{\CTEXthechapter}}{}#2}
    },
    section = {
      format        = \sffamily\normalsize,
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      fixskip       = true,
    },
    subsection = {
      format        = \sffamily\normalsize,
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      indent        = 1 em,
      fixskip       = true,
    },
    subsubsection   = {
      format        = \sffamily\normalsize,
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      indent        = 2 em,
      fixskip       = true,
    },
    paragraph = {
      format        = \sffamily\normalsize,
      beforeskip    = 2.5ex plus 1ex minus .2ex,
      afterskip     = 2.5ex plus .2ex,
      runin         = false,
      fixskip       = true,
    },
  }
\keys_define:nn { ecnu / style }
  {
    numbering .choice:,
    numbering / arabic  .code:n =
      {
        \keys_set:nn { ctex }
          {
            chapter = {
              name          = {,、},
              number        = {\arabic{chapter}},
              numberformat  = \rmfamily,
              aftername     = ,
            },
            section = {
              name          = {,},
              number        = {\arabic{chapter}.\arabic{section}},
              numberformat  = \rmfamily,
            },
            subsection = {
              name          = {,},
              number        =
                {\arabic{chapter}.\arabic{section}.\arabic{subsection}},
              numberformat  = \rmfamily,
            },
            subsubsection = {
              name          = {,},
              number        =
                {
                  \arabic{chapter}.\arabic{section}.
                  \arabic{subsection}.\arabic{subsubsection}
                },
              numberformat  = \rmfamily,
              indent        = 2 em,
            },
            paragraph = {
              name          = {,）},
              number        = {\arabic{paragraph}},
              numberformat  = \rmfamily,
              aftername     = ,
              indent        = 3 em,
            }
          }
      },
    numbering / chinese .code:n =
      {
        \keys_set:nn { ctex }
          {
            chapter = {
              name          = {,、},
              number        = {\chinese{chapter}},
              numberformat  = \sffamily,
            },
            section = {
              name          = {（,）},
              number        = {\chinese{section}},
              numberformat  = \sffamily,
              aftername     = ,
            },
            subsection = {
              name          = {,.},
              number        = {\arabic{subsection}},
              indent        = 2 em,

            },
            subsubsection = {
              name          = {（,）},
              number        = {\arabic{subsubsection}},
              aftername     = {\ },
              indent        = 2 em,
            },
            paragraph = {
              name          = {,）},
              number        = \arabic{paragraph},
              aftername     = ,
              indent        = 4 em,
            }
          }
      },
    numbering / alpha   .code:n =
      {
        \keys_set:nn { ctex }
          {
            chapter = {
              name          = {,.},
              number        = \Alph{chapter},
            },
            section = {
              name          = {(,)},
              number        = \Alph{section},
              aftername     = {\ },
            },
            subsection = {
              name          = {,.},
              number        = \alph{subsection},
              aftername     = {\ },
              numberformat  = \rmfamily,
            },
            subsubsection = {
              name          = {(,)},
              number        = \alph{subsubsection},
              aftername     = {\ },
              numberformat  = \rmfamily,
            },
            paragraph = {
              name          = {,)},
              number        = \alph{paragraph},
              aftername     = {\ },
              numberformat  = \rmfamily,
            },
          }
      },
    numbering / unknown   .code:n = { \__ecnu_error:n { unknown-value } }
  }
\__ecnu_msg_new:nn { unknown-value }
  { The~ value~ "\l_keys_value_tl"~ is~ unknown. }
\cs_new_protected:Npn \__ecnu_title:n #1
  {
    \group_begin:
      \ctexset
        {
          chapter / numbering = false,
          chapter / format    = \sffamily\bfseries\centering,
          chapter / titleformat = \large,
          chapter / afterskip = 3.5ex plus 0.5ex,
        }
      \chapter {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__ecnu_title:n { V }
\cs_new_protected:Npn \__ecnu_abs_title:n #1
  {
    \group_begin:
      \ctexset
        {
          chapter / numbering   = false,
          chapter / format      = \sffamily\bfseries\centering,
          chapter / titleformat = \large,
          chapter / beforeskip  = 2.25 bp,
          chapter / afterskip   = 2.25 bp,
        }
      \chapter* {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__ecnu_abs_title:n { V }
\cs_new_protected:Npn \__ecnu_absEN_title:n #1
  {
    \group_begin:
      \ctexset
        {
          chapter / numbering   = false,
          chapter / format      = \rmfamily\bfseries\centering,
          chapter / titleformat = \large,
          chapter / beforeskip  = 2.25 bp,
          chapter / afterskip   = 2.25 bp,
        }
      \chapter* {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__ecnu_absEN_title:n { V }
\cs_new_protected:Npn \__ecnu_toc_title:n #1
  {
    \group_begin:
      \ctexset
        {
          chapter / numbering   = false,
          chapter / pagestyle   = empty,
          chapter / format      = \rmfamily\bfseries\centering,
          chapter / titleformat = \normalsize,
        }
      \chapter* {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__ecnu_toc_title:n { V }
\fancyhf { }
\fancyhead[C]   { \footnotesize \l__ecnu_info_title_tl }
\fancyfoot[C]   { \footnotesize \thepage }
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__ecnu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\pagestyle { fancy }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \textsuperscript{\@thefnmark} #1
  }
\captionsetup
  {
    font          = small,
    labelsep      = quad,
    justification = centering
  }
\captionsetup [ figure ] [ bi-second ] { name=Figure }
\captionsetup [ table  ] [ bi-second ] { name=Table  }
\cs_set:Npn \thefigure
  {  \thechapter - \int_to_arabic:n { \c@figure } }
\cs_set:Npn \thetable
  {  \thechapter - \int_to_arabic:n { \c@table  } }
\clist_map_inline:nn
  {
    title, titleEN, author, studentID, department, major, supervisor
    academicTitle
  }
  { \tl_new:c { l__ecnu_info_ #1 _tl } }
\clist_new:N \l__ecnu_info_keywords_clist
\clist_new:N \l__ecnu_info_keywordsEN_clist
\int_new:N   \l__ecnu_info_year_int
\int_new:N   \l__ecnu_info_month_int
\int_new:N   \l__ecnu_info_graduation_year_int
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
    keywords        .clist_set:N  = \l__ecnu_info_keywords_clist,
    keywordsEN      .clist_set:N  = \l__ecnu_info_keywordsEN_clist,
    year            .int_set:N    = \l__ecnu_info_year_int,
    month           .int_set:N    = \l__ecnu_info_month_int,
    graduationYear  .int_set:N    = \l__ecnu_info_graduation_year_int,
  }
\NewDocumentCommand \theyear { }
  {
    \int_compare:nNnTF { \l__ecnu_info_year_int } = { \c_zero_int }
      { \int_set_eq:NN \l__ecnu_info_year_int \c_sys_year_int }
      { }
    \int_use:N \l__ecnu_info_year_int
  }
\NewDocumentCommand \themonth { }
  {
    \int_compare:nNnTF { \l__ecnu_info_month_int } = { \c_zero_int }
      { \int_set_eq:NN \l__ecnu_info_month_int \c_sys_month_int }
      { }
    \int_use:N \l__ecnu_info_month_int
  }
\NewDocumentCommand \graduationYear { }
  {
    \int_compare:nNnTF { \l__ecnu_info_graduation_year_int } = { \c_zero_int }
      {
        \int_compare:nNnTF { \l__ecnu_info_year_int } = { \c_zero_int }
          {
            \int_set_eq:NN  \l__ecnu_info_graduation_year_int
                            \c_sys_year_int
          }
          {
            \int_set_eq:NN  \l__ecnu_info_graduation_year_int
                            \l__ecnu_info_year_int
          }
      }
      { }
    \int_use:N  \l__ecnu_info_graduation_year_int
  }
\cs_new_protected:Npn \__ecnu_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \tl_map_inline:nn {#2} { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \__ecnu_spread_box:nn { no }
\cs_new_protected:Npn \__ecnu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__ecnu_center_box:nn { Vn }
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
\tl_const:Nn \c__ecnu_year_tl               { 年 }
\tl_const:Nn \c__ecnu_month_tl              { 月 }
\tl_const:Nn \c__ecnu_day_tl                { 日 }
\tl_const:Nn \c__ecnu_thesisInfo_tl         { 届本科生学士学位论文 }
\tl_const:Nn \c__ecnu_date_tl               { 日期 }
\tl_const:Nn \c__ecnu_orig_sign_tl          { 承诺人签名 }
\tl_const:Nn \c__ecnu_author_sign_tl        { 作者签名 }
\tl_const:Nn \c__ecnu_supervisor_sign_tl    { 导师签名 }
\tl_const:Nn \c__ecnu_name_orig_tl  { 华东师范大学学位论文诚信承诺 }
\tl_const:Nn \c__ecnu_name_auth_tl  { 华东师范大学学位论文使用授权说明 }
\tl_const:Nn \c__ecnu_orig_text_tl
  {
    \par
    本毕业论文是本人在导师指导下独立完成的，内容真实、可靠。本人在撰写
    毕业论文过程中不存在请人代写、抄袭或者剽窃他人作品、伪造或者篡改数据
    以及其他学位论文作假行为。\par
    本人清楚知道学位论文作假行为将会导致行为人受到不授予/撤销学位、开除
    学籍等处理（处分）决定。本人如果被查证在撰写本毕业论文过程中存在学位
    论文作假行为，愿意接受学校依法作出的处理（处分）决定。
  }
\tl_const:Nn \c__ecnu_auth_text_tl
  {
    \par
    本论文的研究成果归华东师范大学所有，本论文的研究内容不得以其它单位的
    名义发表。本学位论文作者和指导教师完全了解华东师范大学有关保留、使用
    学位论文的规定，即：学校有权保留并向国家有关部门或机构送交论文的复印
    件和电子版，允许论文被查阅和借阅；本人授权华东师范大学可以将论文的全部
    或部分内容编入有关数据库进行检索、交流，可以采用影印、缩印或其他复制
    手段保存论文和汇编本学位论文。\par
    保密的毕业论文（设计）在解密后应遵守此规定。
  }
\tl_const:Nn \c__ecnu_name_toc_tl          { 目录 }
\tl_const:Nn \c__ecnu_name_abstract_tl     { 摘要 }
\tl_const:Nn \c__ecnu_name_abstractEN_tl   { Abstract }
\tl_const:Nn \c__ecnu_name_keywords_tl     { 关键词 }
\tl_const:Nn \c__ecnu_name_keywordsEN_tl   { Keywords }
\tl_const:Nn \c__ecnu_colon_tl             { ： }
\tl_const:Nn \c__ecnu_name_appendix_tl  { 附录 }
\tl_const:Nn \c__ecnu_name_acknowledgement_tl  { 致谢 }
\cs_new_protected:Npn \__ecnu_cover_id:
  {
    \__ecnu_fixed_width_box:nn { \textwidth }
      {
        \bfseries\zihao { 4 }
        \graduationYear \c__ecnu_thesisInfo_tl \hfill
        \c__ecnu_schoolNum_tl \c__ecnu_colon_tl \underline{10269}
      }
  }
\cs_new_protected:Npn \__ecnu_orig_sign_area:
  {
    \c__ecnu_orig_sign_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 15 em } { }
    \c__ecnu_date_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 3.4 em } { } \c__ecnu_year_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_month_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_day_tl
  }
\cs_new_protected:Npn \__ecnu_auth_sign_area:
  {
    \c__ecnu_author_sign_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 5.5 em } { }
    \c__ecnu_supervisor_sign_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 5.5 em } { }
    \c__ecnu_date_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 3.4 em } { } \c__ecnu_year_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_month_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_day_tl
  }
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
          \__ecnu_spread_box:no { 4 em } { \l__ecnu_tmpa_tl }
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
\cs_new_protected:Npn \__ecnu_cover_declare_template:nn #1#2
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
  { \__ecnu_cover_declare_template:nn {#1} {#2} }
\DeclareCoverTemplate { cover-i   }
  { id, logo, title, titleEN, info }
\DeclareCoverTemplate { cover-ii  }
  {
    title-space,
    originality-name,
    originality-text,
    originality-sign,
    authorization-name,
    authorization-text,
    authorization-sign
  }
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
    title    / format      = \__ecnu_line_spread:n { 1.1 } \zihao { 1 } \bfseries,
    titleEN  / format      = \__ecnu_line_spread:n { 1.1 } \zihao { 1 } \bfseries,
    id       / bottom-skip = 0 pt plus 0.5 fill,
    logo     / bottom-skip = 0 pt plus 0.3 fill,
    titleEN  / bottom-skip = 0 pt plus 2.5 fill,
    id       / align       = right,
    logo     / align       = center,
    title    / align       = center,
    titleEN  / align       = center,
    info     / align       = center,
  }
\DeclareInstance { ecnu / cover } { cover-ii-default } { cover-ii }
  {
    format                            = \__ecnu_line_spread:n { 1.625 },
    top-skip                          = 0 pt plus 0.2 fill,
    bottom-skip                       = 0 pt plus 2.5 fill,
    originality-name    / content     = \c__ecnu_name_orig_tl,
    originality-text    / content     = \c__ecnu_orig_text_tl,
    originality-sign    / content     = \__ecnu_orig_sign_area:,
    authorization-name  / content     = \c__ecnu_name_auth_tl,
    authorization-text  / content     = \c__ecnu_auth_text_tl,
    authorization-sign  / content     = \__ecnu_auth_sign_area:,
    originality-name    / format      =
      \__ecnu_line_spread:n { 1.2 } \zihao { 4 } \bfseries,
    authorization-name  / format      =
      \__ecnu_line_spread:n { 1.2 } \zihao { 4 } \bfseries,
    title-space         / bottom-skip = 1 em plus 0.2 fill,
    originality-text    / bottom-skip = -0.5 em,
    originality-sign    / bottom-skip = 0 pt plus 0.75 fill,
    authorization-name  / bottom-skip = 0 pt,
    authorization-text  / bottom-skip = 1 em,
    originality-name    / align       = center,
    originality-sign    / align       = right,
    authorization-name  / align       = center,
    authorization-sign  / align       = right,
  }
\tl_new:N \l__ecnu_declaration_page_tl
\keys_define:nn { ecnu / style }
  {
    declarePageResource .code:n =
      {
        \tl_set_eq:NN \l__ecnu_declaration_page_tl \l_keys_value_tl
        \RequirePackage { pdfpages }
      },
  }
\NewDocumentCommand \makecoveri { }
  {
    \thispagestyle { empty }
    \UseInstance { ecnu / cover } { cover-i-default }
  }
\NewDocumentCommand \makecoverii { }
  {
    \cleardoublepage
    \thispagestyle { empty }
    \tl_set:Nn \thepage { C }
    \bool_if:NTF \g__ecnu_decl_page_bool
      {
        \tl_if_empty:NTF \l__ecnu_declaration_page_tl
          { \UseInstance { ecnu / cover } { cover-ii-default } }
          { \includepdf { \l__ecnu_declaration_page_tl } }
      }
      {}
  }
\keys_set:nn { ctex }
  {
    contentsname  = \c__ecnu_name_toc_tl,
    tocdepth      = 1,
  }
\PassOptionsToPackage { titles } { tocloft }
\RequirePackage { tocloft }
\RenewDocumentCommand \cftchapleader { }
  {\bfseries\cftdotfill{1.0}}
\RenewDocumentCommand \cftsecleader { }
  {\cftdotfill{1.0}}
\setlength{\cftbeforechapskip}{6pt}
\setlength{\cftchapnumwidth}{0pt}
\setlength{\cftsecnumwidth}{0pt}
\RenewDocumentCommand \@tocrmarg { } { 0pt }
\RenewDocumentCommand \cftchapfillnum { m }
  {
    {\cftchapleader}\nobreak
    {\cftchappagefont #1}\cftchapafterpnum\par
  }
\RenewDocumentCommand \cftsecfillnum { m }
  {
    {\cftsecleader}\nobreak
    {\cftsecpagefont #1}\cftsecafterpnum\par
  }
\RenewDocumentCommand \tableofcontents { }
  {
    \pagestyle{ empty }
    \__ecnu_toc_title:V \contentsname
    \group_begin:
      \__ecnu_line_spread:n {1.2}
      \@starttoc{toc}
    \group_end:
    \cleardoublepage
    \pagestyle{ fancy }
  }
\__ecnu_preto_cmd:Nn \section
  {
    \int_compare:nNnTF { \c@section } = { \c_zero_int }
      { \addtocontents{toc}{\protect\vspace{6pt}} }
      { }
  }
\RenewDocumentEnvironment { abstract  } { }
  { \__ecnu_abstract_begin:    } { \__ecnu_abstract_end:      }
\NewDocumentEnvironment { abstractEN } { }
  { \__ecnu_abstractEN_begin: } { \__ecnu_abstractEN_end:   }
\cs_new_protected:Npn \__ecnu_abstract_begin:
  {
    \addcontentsline{toc}{chapter}{\c__ecnu_name_abstract_tl}
    \__ecnu_abs_title:V \l__ecnu_info_title_tl
    \small
    \hbox:n {} \mode_leave_vertical: \par \noindent
    \group_begin:
      \rmfamily\bfseries \c__ecnu_name_abstract_tl \c__ecnu_colon_tl
    \group_end:
    \par
  }
\cs_new_protected:Npn \__ecnu_abstractEN_begin:
  {
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \__ecnu_absEN_title:V \l__ecnu_info_titleEN_tl
    \small
    \hbox:n {} \mode_leave_vertical: \par \noindent
    \group_begin:
      \rmfamily\bfseries \c__ecnu_name_abstractEN_tl \c__ecnu_colon_tl
    \group_end:
    \par
  }
\cs_new_protected:Npn \__ecnu_abstract_end:
  {
    \__ecnu_keywords:nNn
      { \rmfamily\bfseries \c__ecnu_name_keywords_tl \c__ecnu_colon_tl }
      \l__ecnu_info_keywords_clist { ， }
    \cleardoublepage
  }
\cs_new_protected:Npn \__ecnu_abstractEN_end:
  {
    \__ecnu_keywords:nNn
      { \rmfamily\bfseries \c__ecnu_name_keywordsEN_tl \c__ecnu_colon_tl }
      \l__ecnu_info_keywordsEN_clist { ,~ }
    \cleardoublepage
  }
\cs_new_protected:Npn \__ecnu_keywords:nNn #1#2#3
  {
    \par \mode_leave_vertical: \par \noindent
    \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim {#1}
    \group_begin: #1 \group_end:
    \parbox [t] { \dim_eval:n { \textwidth - \l__ecnu_tmpa_dim } }
      {
        \clist_use:Nn #2 {#3} \par
        \cs_gset:Npx \__ecnu_keywords_prevdepth:
          { \dim_use:N \tex_prevdepth:D }
      }
  }
\RenewDocumentEnvironment { appendix } { }
  { \__ecnu_appendix_begin: } { \__ecnu_appendix_end: }
\cs_new_protected:Npn \__ecnu_appendix_begin:
  {
    \cleardoublepage
    \__ecnu_title:V \c__ecnu_name_appendix_tl
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \small
  }
\cs_new_protected:Npn \__ecnu_appendix_end:
  {
    \cleardoublepage
  }
\NewDocumentEnvironment { acknowledgement } { }
  { \__ecnu_acknowledgement_begin: }
  { \__ecnu_acknowledgement_end: }
\cs_new_protected:Npn \__ecnu_acknowledgement_begin:
  {
    \cleardoublepage
    \__ecnu_title:V \c__ecnu_name_acknowledgement_tl
    \small
  }
\cs_new_protected:Npn \__ecnu_acknowledgement_end:
  {
    \cleardoublepage
  }
\tl_new:N \l__ecnu_bib_resource_tl
\keys_define:nn { ecnu / style }
  {
    bibResource .tl_set:N = \l__ecnu_bib_resource_tl
  }
\__ecnu_gadd_ltxhook:nn { env/document/begin }
{
  \__ecnu_biblatex_pre_setup:
  \RequirePackage { biblatex }
  \__ecnu_biblatex_post_setup:
}
\cs_new_protected:Npn \__ecnu_biblatex_pre_setup:
  {
    \PassOptionsToPackage
    {
      backend   = biber,
      style     = gb7714-2015,
      seconds   = true,
      hyperref  = true,
      gbpub     = false,
      gbpunctin = false,
    }
    { biblatex }
  }
\cs_new_protected:Npn \__ecnu_biblatex_post_setup:
  {
    \exp_args:NV \addbibresource \l__ecnu_bib_resource_tl
    \__ecnu_biblatex_allow_url_break:
    \RenewDocumentCommand \bibfont { } { \small }
    \setlength{\bibitemsep}{0pt}
    \defbibheading { bibliography } [ \bibname ]
      { \__ecnu_title:n {##1} }
  }
\cs_new:Npn \__ecnu_biblatex_allow_url_break:
  {
    \int_set_eq:NN \c@biburlucpenalty  \c_one_int
    \int_set_eq:NN \c@biburlnumpenalty \c_one_int
    \int_set_eq:NN \c@biburllcpenalty  \c_one_int
  }
\NewDocumentCommand \PrintReference {}
  {
    \printbibliography
    \cleardoublepage
  }
\PassOptionsToPackage { hidelinks, hypertexnames=false } { hyperref }
\RequirePackage { hyperref }
\AtBeginDocument
  {
    \newgeometry
      {
        top     = 2.0 cm,
        bottom  = 2.0 cm,
        left    = 3.0 cm,
        right   = 3.0 cm
      }
    \begin{titlepage}
      \makecoveri \newpage \makecoverii
    \end{titlepage}
    \restoregeometry
  }
\keys_define:nn { ecnu }
  {
    info  .meta:nn = { ecnu / info  } {#1},
    style .meta:nn = { ecnu / style } {#1}
  }
\NewDocumentCommand \ecnuSetup { m }
  { \keys_set:nn { ecnu } {#1} }
\NewDocumentCommand \frontmatter { }
  { \cleardoublepage\pagenumbering{Roman} }
\NewDocumentCommand \mainmatter { }
  { \cleardoublepage\pagenumbering{arabic} }
\NewDocumentCommand \backmatter { }
  { \clearpage{\thispagestyle{empty}\cleardoublepage} }
\keys_set:nn { ecnu / style }
  {
    font      = xits,
    fontCJK   = fandol,
    numbering = arabic,
  }
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
\endinput
%%
%% End of file `ecnuthesis.cls'.
