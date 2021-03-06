% Команда для подключения шаблона: \documentclass[12pt, left=25mm,right=10mm,top=15mm,bottom=15mm]{templateReportBMSTU}

\NeedsTeXFormat {LaTeX2e}
\ProvidesClass{templateReportBMSTU} [2020/06/18 Шаблон отчётов МГТУ им. Н. Э. Баумана]

\RequirePackage{kvoptions}

\DeclareStringOption[25mm]{left}[25mm] % Левое поле
\DeclareStringOption[15mm]{right}[15mm] % Правое поле
\DeclareStringOption[20mm]{top}[20mm] % Верхнее поле
\DeclareStringOption[20mm]{bottom}[20mm] % Нижнее поле
\DeclareStringOption[python]{language}[python] % Язык для листинга
\ProcessKeyvalOptions*

\LoadClass[utf8x, oneside, a4paper]{article}

\RequirePackage{extsizes} % Для добавления в параметры класса документа 14pt

% Для работы с несколькими языками и шрифтом Times New Roman по-умолчанию
\RequirePackage[english,russian]{babel}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% ГОСТовские настройки для полей и абзацев
\RequirePackage[left=\templateReportBMSTU@left,right=\templateReportBMSTU@right,top=\templateReportBMSTU@top,bottom=\templateReportBMSTU@bottom]{geometry}
\RequirePackage{misccorr}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}

\setlength{\parindent}{1.25cm}
\linespread{1.3}
\setlist{nolistsep} % Отсутствие отступов между элементами \enumerate и \itemize

% Дополнительное окружения для подписей
\RequirePackage{array}
\newenvironment{signstabular}[1][1]{
	\renewcommand*{\arraystretch}{#1}
	\tabular
}{
	\endtabular
}

% Переопределение стандартных \section, \subsection, \subsubsection по ГОСТу;
% Переопределение их отступов до и после для 1.5 интервала во всем документе
\RequirePackage{titlesec}

\titleformat{\section}[block]
{\bfseries\normalsize\filcenter}{\thesection}{1em}{}

\titleformat{\subsection}[hang]
{\bfseries\normalsize}{\thesubsection}{1em}{}
\titlespacing\subsection{\parindent}{\parskip}{\parskip}

\titleformat{\subsubsection}[hang]
{\bfseries\normalsize}{\thesubsubsection}{1em}{}
\titlespacing\subsubsection{\parindent}{\parskip}{\parskip}

% Работа с изображениями и таблицами; переопределение названий по ГОСТу
\RequirePackage{caption}
\captionsetup[figure]{name={Рисунок},labelsep=endash}
\captionsetup[table]{singlelinecheck=false, labelsep=endash}

\RequirePackage{graphicx}

% Цвета для гиперссылок и листингов
\RequirePackage{color}

% Гиперссылки \toc с кликабельностью
\RequirePackage{hyperref}

\hypersetup{
	linktoc=all,
	linkcolor=black,
	colorlinks=true,
}

% Листинги
\setsansfont{Arial}
\setmonofont{Courier New}

\RequirePackage{color} % Цвета для гиперссылок и листингов
\definecolor{comment}{rgb}{0,0.5,0}
\definecolor{plain}{rgb}{0.2,0.2,0.2}
\definecolor{string}{rgb}{0.91,0.45,0.32}

\RequirePackage{listings}
\lstset{
	basicstyle=\footnotesize\ttfamily,
	language=\templateReportBMSTU@language, % [Sharp]C  Или другой ваш язык -- см. документацию пакета
	commentstyle=\color{comment},
	numbers=left,
	numberstyle=\tiny\color{plain},
	numbersep=5pt,
	tabsize=4,
	extendedchars=\true,
	breaklines=true,
	keywordstyle=\color{blue},
	frame=b,
	stringstyle=\ttfamily\color{string}\ttfamily,
	showspaces=false,
	showtabs=false,
	xleftmargin=17pt,
	framexleftmargin=17pt,
	framexrightmargin=5pt,
	framexbottommargin=4pt,
	showstringspaces=false,
	inputencoding=utf8x,
	keepspaces=true
}

\DeclareCaptionLabelSeparator{line}{\ --\ }
\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}{\colorbox[cmyk]{0.43,0.35,0.35,0.01}{\parbox{\textwidth}{\hspace{15pt}#1#2#3}}}
\captionsetup[lstlisting]{
	format=listing,
	labelfont=white,
	textfont=white,
	singlelinecheck=false,
	margin=0pt,
	font={bf,footnotesize},
	labelsep=line
}


% Годные пакеты для обычных действий
\RequirePackage{ulem} % Нормальное нижнее подчеркивание
\RequirePackage{hhline} % Двойная горизонтальная линия в таблицах
\RequirePackage[figure,table]{totalcount} % Подсчет изображений, таблиц
\RequirePackage{rotating} % Поворот изображения вместе с названием
\RequirePackage{lastpage} % Для подсчета числа страниц
\newcounter{numberlisting}
\setcounter{numberlisting}{1}