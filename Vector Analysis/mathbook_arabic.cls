\listfiles
\def\fileversion{1.3}
\def\filedate{2016/09/07}
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{mathbook_arabic}[%
  \filedate\space v\fileversion\space
  mathbook document class. Stephane PASQUET]
%this class had been developed by Mohammed AL Bitar\email\moh.bitar11@gmail.com
% MAJ du 2013/06/12 : rectification de la déclaration de l'option "inputenc"
% MAJ du 2013/08/18 : rectification de la déclaration de l'option utf8 (il manquait le "8" dans "DeclareOption"
% MAJ du 2016/05/08 : changement d'ordre de l'appel des packages "numpprint" et "babel", création de la commande \breakbox
% MAJ du 2016/09/07 : corrrection du bug concernant la disposition des exos/corrigés + création des commandes \DefineNewBoxLikeDef et \DefineNewBoxLikeRem
%
\newif\if@ams
\newif\if@openany
\newif\if@dixpt
\newif\if@onzept
\newif\if@douzept
\newif\if@presentation
\newif\if@latinone
\newif\if@ansinew
\newif\if@applemac
\newif\if@ascii
\newif\if@latinnine
\newif\if@utfheight

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Options de classes %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
% encodage
\DeclareOption{latin1}{\def\inputoption{latin1}}
\DeclareOption{ansinew}{\def\inputoption{ansinew}}
\DeclareOption{applemac}{\def\inputoption{applemac}}
\DeclareOption{ascii}{\def\inputoption{ascii}}
\DeclareOption{latin9}{\def\inputoption{latin9}}
\DeclareOption{utf8}{\def\inputoption{utf8}}
%
\DeclareOption{openany}{\@openanytrue}
\DeclareOption{10pt}{\@dixpttrue}
\DeclareOption{11pt}{\@onzepttrue}
\DeclareOption{12pt}{\@douzepttrue}
\DeclareOption{ams}{\@amstrue}
\DeclareOption{presentation}{\@presentationtrue}

\ProcessOptions

\xdef\optionsbook{a4paper}
\if@openany
	\xdef\optionsbook{\optionsbook,openany}
\fi
\if@dixpt
	\xdef\optionsbook{\optionsbook,10pt}
\else
	\if@onzept
		\xdef\optionsbook{\optionsbook,11pt}
	\else
		\if@douzept
			\xdef\optionsbook{\optionsbook,12pt}
		\fi
	\fi
\fi

\LoadClass[\optionsbook]{book}
%
%%%%%%%%%%%%%%%%%
%%% Packages  %%%
%%%%%%%%%%%%%%%%%
%
%\RequirePackage[ut]{inputenc}
%\RequirePackage[T1]{fontenc}
\RequirePackage{cellspace}
\RequirePackage[cmyk,table]{xcolor} 
\RequirePackage[explicit]{titlesec}
\RequirePackage{tikz}
\usetikzlibrary{calc,decorations.pathmorphing,decorations.text}
\RequirePackage[tmargin=2cm,bmargin=2.5cm,hmargin=2cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{eso-pic}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{verbatim}
\RequirePackage{multido}
\RequirePackage{multicol,listings}
\RequirePackage{fp}
\input{colors_2}
 \RequirePackage{amsmath,amsfonts,amssymb}
 \RequirePackage{lipsum}
\RequirePackage[colorlinks=true,linkcolor=corref@color]{hyperref}
\if@ams
	\RequirePackage{amsmath,amsfonts,amssymb}
\fi
%\RequirePackage[frenchb]{babel}
%\frenchbsetup{StandardLists=true}
\RequirePackage[autolanguage]{numprint} 
%
\RequirePackage{polyglossia}
%\frenchbsetup{StandardLists=true}
\setdefaultlanguage[calendar=gregorian, numerals=maghrib]{arabic}
\setotherlanguage{english}

\newfontfamily\arabicfont[Script=Arabic]{Amiri}
\newfontfamily\arabicfonttt[Script=Arabic]{Amiri}
\newfontfamily\arabicfonttt{Latin Modern Mono}

%\gappto\captionsarabic{\renewcommand{\chaptername}{الفصل}}

\let\arabicfonttt\ttfamily
\let\arabicfontsf\sffamily

%\newcommand\words[1]{\expandafter\xwords\csname c@#1\endcsname}
%\def\xwords#1{\ifcase#1\or
%الأول
%\or
%الثاني
%\or
%الثالث
%\or
%الرابع
%\or
% الخامس
%\or
%السادس
%\or
%السابع
%\or
%الثامن
%\or
%التاسع\or
%العاشر\or
%\else
%I need more words\fi}
% \makeatletter
%\patchcmd{\@makechapterhead}{\thechapter}{\words{chapter}}{}{}
%\makeatother






\input{lengths_2}
\input{fonts_2}
\input{pagestyles_2}
\input{sectionstyles_2}
\input{commandes_2}


 \gappto\captionsarabic{\renewcommand{\chaptername}{الفصل}}
 
 \newcommand\words[1]{\expandafter\xwords\csname c@#1\endcsname}
\def\xwords#1{\ifcase#1\or
الأول
\or
الثاني
\or
الثالث
\or
الرابع
\or
 الخامس
\or
السادس
\or
السابع
\or
الثامن
\or
التاسع\or
العاشر\or
\else
I need more words\fi}
 \makeatletter
\patchcmd{\@makechapterhead}{\thechapter}{\words{chapter}}{}{}
\makeatother

\endinput
