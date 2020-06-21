% Команда для подключения шаблона: \documentclass[12pt, left=25mm,right=10mm,top=15mm,bottom=15mm]{templateReportBMSTU}

\NeedsTeXFormat {LaTeX2e}
\ProvidesClass{templateTaskBMSTU} [2020/06/18 Шаблон задания на выполнение работ МГТУ им. Н. Э. Баумана]
\LoadClass[oneside, a4paper]{article}

\RequirePackage{kvoptions}

\DeclareStringOption[25mm]{left}[25mm] % Левое поле
\DeclareStringOption[15mm]{right}[15mm] % Правое поле
\DeclareStringOption[20mm]{top}[20mm] % Верхнее поле
\DeclareStringOption[20mm]{bottom}[20mm] % Нижнее поле
\ProcessKeyvalOptions*

\RequirePackage{extsizes} % Для добавления в параметры класса документа 14pt

% Для работы с несколькими языками и шрифтом Times New Roman по-умолчанию
\RequirePackage[english,russian]{babel}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% ГОСТовские настройки для полей и абзацев
\RequirePackage[left=\templateTaskBMSTU@left,right=\templateTaskBMSTU@right,top=\templateTaskBMSTU@top,bottom=\templateTaskBMSTU@bottom]{geometry}

% Дополнительное окружения для подписей
\RequirePackage{array}
\newenvironment{signstabular}[1][1]{
	\renewcommand*{\arraystretch}{#1}
	\tabular
}{
	\endtabular
}


\RequirePackage{ulem} % Нормальное нижнее подчеркивание
\usepackage{multirow} % Объединение ячеек в таблицах