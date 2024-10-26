%----------------------------------------------------------------------------------------------------------------------%
% Class Brief
% 
% 	Breached CV is a LaTeX template for Curriculum Vitaes (CV), Cover Letters, and Personal Statements
% 
% 	Class: 	breached-cv
% 	Author: skyebreach (https://github.com/skyeBreach)
%   File: breached-cv.cls
%
%----------------------------------------------------------------------------------------------------------------------%
% BEGIN_FOLD

	%----------------------------------------------------------------------------------------------------------------------%
	%    Description
	%----------------------------------------------------------------------------------------------------------------------%
	% BEGIN_FOLD
		
		
	
	% END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Options
	%----------------------------------------------------------------------------------------------------------------------%
	% BEGIN_FOLD
	
		% draft, final
		%
		%
		% debug
		%
		%
		% cv, coverletter, personalstatement
		%
		%
	
	% END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    License
	%----------------------------------------------------------------------------------------------------------------------%
	% BEGIN_FOLD
		
		
	
	% END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Legal Notice
	%----------------------------------------------------------------------------------------------------------------------%
	% BEGIN_FOLD
		
		
	
	% END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Documentation
	%----------------------------------------------------------------------------------------------------------------------%
	% BEGIN_FOLD
		
		
	
	% END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%

% END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Class Definition Variables
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Definition for the classes name
	\def\breachedcv@className{breached-cv}
	
	% Definition for the classes label
	\def\breachedcv@classLabel{Breached CV Class}
	
	% Definition for the classes author
	\def\breachedcv@packageAuthor{skyebreach (https://github.com/skyeBreach)}
	
	% Definition for the classes release date
	\def\breachedcv@classReleaseDate{2024/10/10}

	% Definitions for the classes version
	\def\breachedcv@classVersion{1.0.0}

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Class Identification
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Defines the class, and some basic information about it
	\ProvidesClass{\breachedcv@className}
		[\breachedcv@classReleaseDate~\breachedcv@classVersion~(\breachedcv@packageAuthor)~\breachedcv@classLabel]
	
	% Defines the LaTeX version
	\NeedsTeXFormat{LaTeX2e}

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Class Option Conditionals
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD
	
	% Conditional that determines if the document is a draft
	%	Default: true
	\newif\if@draft					\@drafttrue
	
	% Conditional that determines if the document is final
	%	Default: false
	\newif\if@final					\@finalfalse
	
	% Conditional that determines if the debug information should be show
	%	Default: false
	\newif\if@bShowDebug			\@bShowDebugfalse
	
	% Conditional that determines if the document's subtype is `cv`
	%	Default: true
	\newif\if@cv					\@cvtrue
	
	% Conditional that determines if the document's subtype is `coverletter`
	%	Default: false
	\newif\if@coverLetter			\@coverLetterfalse
	
	% Conditional that determines if the document's subtype is `personalstatement`
	%	Default: false
	\newif\if@personalStatement		\@personalStatementfalse
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Class Option Helpers
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Returns either `draft` or `final` depending on which one is active
	% 	Usage: \documentDraftOrFinal
	\newcommand*{\documentDraftOrFinal}{%
		\if@draft draft\fi%
		\if@final final\fi%
	}%
	
	% Runs the provided code depending on if the debug option is on
	%	Usage: \IfShowDebug{<If Debug>}{<If Not Debug>}
	\newcommand*{\IfShowDebug}[2]{%
		\if@bShowDebug #1%
		\else #2\fi%
	}%
	
	% Runs the provided code depending on the subtype for the document
	%	Usage: \IfDocumentSubtype{<If CV>}{<If Cover Letter>}{<If Personal Statement>}{<If Error>}
	\newcommand*{\IfDocumentSubtype}[4]{%
		\if@cv #1%
		\else {%
			\if@coverLetter #2%
			\else {%
				\if@personalStatement #3%
				\else #4\fi%
			}\fi%
		}\fi%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Class Options
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Options for draft or final style documents
	\DeclareOption{draft}{\@drafttrue\@finalfalse}
	\DeclareOption{final}{\@draftfalse\@finaltrue}
	
	% Option for showing the debug data at the start of the document
	\DeclareOption{debug}{\@bShowDebugtrue} % \@finalfalse\@drafttrue
	
	% Options that define the subtype for the document
	\DeclareOption{cv}{\@cvtrue\@coverLetterfalse\@personalStatementfalse}
	\DeclareOption{coverletter}{\@cvfalse\@coverLettertrue\@personalStatementfalse}
	\DeclareOption{personalstatement}{\@cvfalse\@coverLetterfalse\@personalStatementtrue}
	
	% Inherit all options from the "article" class, as this class is based off of it
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
	
	% Executes the options in the provided order above
	\ProcessOptions\relax
	
	% Load the article class, as this class is based off of it
	\LoadClass[\documentDraftOrFinal]{article}

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%	External Packages
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	%----------------------------------------------------------------------------------------------------------------------%
	%    Encoding Packages
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Allows for the specification of an input encoding
		% 	- utf8: Enables support for the UTF-8 input encoding
		\RequirePackage[utf8]{inputenc} 
		
		% Allows for the specification of an output font encoding
		% 	- T1: Enables support for the T1 font encoding
		\RequirePackage[T1]{fontenc} 
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Layout Packages
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Used to configure the page layout
		\RequirePackage{geometry}
		
		% Used to easily modify the document's page layout
		\RequirePackage{fancyhdr}
		
		% Used to calculate the number of pages in the document, e.g. Needed for "<current page> of <last page>"
		\RequirePackage{lastpage} 
		
		% Allows for the creation and usage of hyperlinks
		% 	- hidelinks: 			Removes colour and border from links
		% 	- unicode: 				Uses unicode to encode PDF strings
		% 	- pdfpagelabels=false:	Disables page labels which stops it from generating anchors, used to avoid issues
		\RequirePackage[hidelinks, unicode, pdfpagelabels=false, \documentDraftOrFinal]{hyperref}
		
		% Allows for the modification of sectional heading fonts
		\RequirePackage{sectsty} 
		
		% Extends the functionality for the array and tabular environments
		\RequirePackage{array}
		
		% Extends the functionality for the enumerate, itemize, and description environments
		\RequirePackage{enumitem}
		
		% Adds new commands for text alignment
		\RequirePackage{ragged2e}
		
		% Used to change the spacing of specific text and environments
		\RequirePackage{setspace}
		
		% Allows for the management of paragraph spacing
		\RequirePackage{parskip}
		
		% Improved bookmark managment, including this solves some bookmark errors
		\RequirePackage{bookmark}
	
		% TODO Comment
		%
		\RequirePackage{tabstackengine}
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Styling Packages
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Used to extend and manage latex's colours
		\RequirePackage{xcolor}
		
		% Provides environments for text boxes that can be framed and coloured
		%	- skins: Loads the skins library, this provides a catalog of premade "skins" to use
		\RequirePackage[skins]{tcolorbox}
		
		% Provides commands to allow for table cell, row, and column colouring. Primarily used in development for testing
		\usepackage[]{colortbl}
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Font and Icon Packages
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Used to manage and easily specify custom fonts, (Requires XeTex or LuaTex).
		%	- quiet: This is set to so all warnings are written to .log file instead of the editor's log
		\RequirePackage[quiet]{fontspec}	
		
		% Provides extra mathematical symbols from AMS fonts msam and msbm
		\RequirePackage{amssymb}
		
		% Provides the icons from "Font Awesome 5"
		\RequirePackage{fontawesome5}
		
		% Provides the "roboto" font
		\RequirePackage{roboto}
		
		% Provides the "Source Sans Pro" font
		%	- default:	Sets the default font family and the sans serif family to "Source Sans Pro"
		%	- opentype: Overrides automatic detection and uses OpenType fonts
		\RequirePackage[default, opentype]{sourcesanspro}
		
		% Provides the "NewComputerModern" fonts
		\RequirePackage{newcomputermodern}
		
		% Provides the "Charter" Fonts
		\RequirePackage{xcharter}
		
		% Allows for the management of mathematical environment fonts
		% **Warning: Must be loaded after any maths font package**
		\RequirePackage{unicode-math}
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Programming and Development Packages
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
		
		% Used to check if we are using XeTeX for typesetting, Provides "\ifxetex" boolean and "\RequireXeTeX" command
		\RequirePackage{ifxetex}
		
		% Extends the "ifthen" package, and provides an extended set of conditional commands
		\RequirePackage{xifthen}
		
		% Used to manipulate strings, i.e. It is used here to format and strip characters from the phone number
		\RequirePackage{xstring}
		
		% Provides a toolbox of programming tools, and is geared primarily towards LaTeX class and package author
		\RequirePackage{etoolbox}
		
		% Provides commands for date and time formatting
		\RequirePackage{datetime}
		
		% TODO Comment
		%
		\RequirePackage{lipsum}
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%	Directory Configuration
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD



%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Personal Information Configuration Variables
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD
	
	%----------------------------------------------------------------------------------------------------------------------%
	%    Basic Information
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% [Required] Full Name
		% Defines the job seekers full name 
		%    Usage: \name{<firstname>}{<lastname>}
		\NewDocumentCommand{\name}{m m}{
			\def\@firstName{#1}
			\def\@lastName{#2}
			\def\@name{#1~#2}
		}
		
		% [Optional] Personal Title
		% Defines the job seekers title, e.g. Mx, Miss, Mr, Dr, etc
		%    Usage: \title{<title>}
		\NewDocumentCommand{\personalTitle}{m}{
			\def\@personalTitle{#1}
		}
			
		% [Optional] Date of Birth
		% Defines the job seekers date of birth
		%    Usage: \dateOfBirth{<day>}{<month>}{<year>}
		\NewDocumentCommand{\dateOfBirth}{m m m}{
			\def\@dateOfBirthDay{#1}\def\@dateOfBirthMonth{#2}\def\@dateOfBirthYear{#3}
		}
		
		% [Optional] Address
		% Defines the job seekers address objects
		%    Usage: \address{<Street Address>}{<City/Town>}{<Post Code>}
		\NewDocumentCommand{\address}{m m m}{
			\def\@addressStreet{#1}
			\def\@addressCity{#2}
			\def\@addressPostCode{#3}
			\def\@addressFull{#1,\space#2,\space#3}
		}
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Contact Information
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% [Required] Mobile Phone Number
		% Defines the mobile phone number and the telephone URI for the job seeker, this number should be contactable
		%    Usage: \mobileNumber{<mobile number>}
		\NewDocumentCommand{\mobileNumber}{m}{
			\def\@mobileNumber{#1}
			\def\@telUri{tel: \@mobileNumber}
			
			% Formats the mobile number as a telephone uri, this is used by href
			\StrDel{\@telUri}{ }[\@telUri]
			\StrDel{\@telUri}{-}[\@telUri]
			\StrDel{\@telUri}{(}[\@telUri]
			\StrDel{\@telUri}{)}[\@telUri]
		}
		
		% [Optional] Personal Email
		% Defines the main personal email for the job seeker, this email should be contactable
		%    Usage: \personalEmail{<email address>}
		\NewDocumentCommand{\personalEmail}{m}{\def\@personalEmail{#1}}
		
		% [Optional] Work Email
		% Defines the main work or business email for the job seeker, this email should be contactable
		%    Usage: \workEmail{<email address>}
		\NewDocumentCommand{\workEmail}{m}{\def\@workEmail{#1}}
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Job Information
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% [Optional] Job Position
		% Defines the job seekers, current or intended job position
		% 	Usage: \position{<position>}
		\newcommand*{\position}[1]{\def\@position{#1}}%
		
		% TODO Potentially move this to a settings section
		% Boolean value to switch from "Work Email" to "Business Email", the former is used when true
		\newbool{bWorkEmail}
		\setbool{bWorkEmail}{true}
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Social Media and Internet Information
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% [Optional] Url to personal/portfolio website
		% Defines the job seekers internet home page
		% 	Usage: \homepage{<url>}
		\newcommand*{\homepage}[1]{\def\@homepage{#1}}
		
		% [Optional] GitHub Username
		% Defines the job seekers GitHub username, this is used to display a hyperlink to the GitHub profile
		% 	Usage: \github{<GitHub Username>}
		\newcommand*{\gitHub}[1]{\def\@gitHub{#1}}
		
		% [Optional] GitLab Username
		% Defines the job seekers GitLab username, this is used to display a hyperlink to the GitLab profile
		% 	Usage: \gitlab{<GitLab Username>}
		\newcommand*{\gitLab}[1]{\def\@gitLab{#1}}
		
		% [Optional] LinkedIn Username
		% Defines the job seekers LinkedIn username, this is used to display a hyperlink to the LinkedIn profile
		% 	Usage: \linkedin{<LinkedIn Username>}
		\newcommand*{\linkedIn}[1]{\def\@linkedIn{#1}}
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	Colour Configuration
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD
	
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Neutral Colours
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		\definecolor{white}{HTML}{FFFFFF}%
		\definecolor{black}{HTML}{000000}%
		\definecolor{darkGrey}{HTML}{333333}%
		\definecolor{grey}{HTML}{5D5D5D}%
		\definecolor{lightGrey}{HTML}{999999}%
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Text Colours
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		\definecolor{darkText}{HTML}{414141}%
		\colorlet{text}{darkGrey}%
		\colorlet{greyText}{grey}%
		\colorlet{lightText}{lightGrey}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Dev and Testing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		\definecolor{green}{HTML}{C2E15F}
		\definecolor{orange}{HTML}{FDA333}
		\definecolor{purple}{HTML}{D3A4F9}
		\definecolor{red}{HTML}{FB4485}
		\definecolor{blue}{HTML}{6CE0F1}
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Page and Document Layout Config
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	%----------------------------------------------------------------------------------------------------------------------%
	%    Page Layout
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		%----------------------------------------------------------------------------------------------------------------------%
		%    Geometry Configuration
		%----------------------------------------------------------------------------------------------------------------------%
		%BEGIN_FOLD
		
			% Set the geometry (margins) for the page
			\geometry{top=10mm, bottom=15mm, left=15mm, right=15mm, footskip=3.75mm}%top=10mm, bottom=15mm, left=15mm, right=15mm, footskip=3.75mm
			
		%END_FOLD
		%----------------------------------------------------------------------------------------------------------------------%
		%    Fancy Header Configuration
		%----------------------------------------------------------------------------------------------------------------------%
		%BEGIN_FOLD
		
			% Define the offset to use for the footer and header
			\fancyhfoffset{0em}
			
			% Clear all default fancy header and footer fields
			\fancyhf{}
			
			% Define a custom page style to use for the cv
			\fancypagestyle{plain}{
				\cfoot{\thepage\space of \pageref{LastPage}}
			}

			% Tell LaTeX to use our custom page style
			\pagestyle{plain}
			
			% Disable the default header and footer horizontal rule
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0pt}
			
		%END_FOLD	
		%----------------------------------------------------------------------------------------------------------------------%
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Links and Hypertext Configuration
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Sets up the hyperref package, and configures the pdf metadata with empty data
		\hypersetup{
			pdftitle={},
			pdfauthor={},
			pdfsubject={},
			pdfkeywords={}
		}
		
		% [Warning] Should only be called after job seeker data has been entered!
		% Sets up the hyperref package, and configures the pdf metadata from the provided data
		%     Usage: \pdfMetaSetup
		\newcommand{\pdfMetaSetup}{
			\hypersetup{
				pdftitle={CV-\@name},
				pdfauthor={\@name},
				pdfsubject={A curriculum vitae made by \@name, using breached-cv in latex},
				pdfkeywords={CV, Curriculum Vitae, breached-cv}
			}
		}
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%    Section and Paragraph Configuration
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Disable the native section numbering (Not needed for a cv)
		\setcounter{secnumdepth}{0} 
		
		% Disable indentation for new paragraphs
		\setlength\parindent{0pt} 
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Font Configuration
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	%----------------------------------------------------------------------------------------------------------------------%
	%	Default Font Configuration
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Define default font features for fontspec
		\defaultfontfeatures{%
			Ligatures=TeX% 		Requred to enable LaTeX quoting styles (joined quotations)
		}%
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Font Specifications
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Defines the main font for 'NewComputerModern' and creates a switch command that sets the block to the font
		\newfontfamily\newComputerModern[%
			SmallCapsFeatures={Numbers=OldStyle},%
			BoldSlantedFont=NewCM10-Bold.otf,%
			SlantedFont=NewCM10-Book.otf,%
			BoldItalicFont=NewCM10-BoldItalic.otf,%
			BoldFont=NewCM10-Bold.otf,%
			ItalicFont=NewCM10-BookItalic.otf,%
			SlantedFeatures={FakeSlant=0.25},%
			BoldSlantedFeatures={FakeSlant=0.25},%
		]{NewCM10-Book}%
		
		% Defines the sans font for 'NewComputerModern' and creates a switch command that sets the block to the font
		\newfontfamily\newComputerModernSans[%
			ItalicFont=NewCMSans10-BookOblique.otf,%
			BoldFont=NewCMSans10-Bold.otf,%
			BoldItalicFont=NewCMSans10-BoldOblique.otf,%
			SmallCapsFeatures={Numbers=OldStyle},%
			SlantedFont=NewCMSans10-BookOblique.otf,%
			BoldSlantedFont=NewCMSans10-BoldOblique.otf,%
		]{NewCMSans10-Book}%
		
		% Defines the mono font for 'NewComputerModern' and creates a switch command that sets the block to the font
		\newfontfamily\newComputerModernMono[%
			ItalicFont=NewCMMono10-BookItalic.otf,%
			BoldFont=NewCMMono10-Bold.otf,%
			BoldItalicFont=NewCMMono10-BoldOblique.otf,%
			SlantedFont=NewCMMono10-Book.otf,%
			SlantedFeatures={FakeSlant=0.25},
			BoldSlantedFont=NewCMMono10-Bold.otf,%
			BoldSlantedFeatures={FakeSlant=0.25},%
			SmallCapsFeatures={Numbers=OldStyle}%
		]{NewCMMono10-Book}%
		
		% Defines the main font for 'Charter' and creates a switch command that sets the block to the font
		\newfontfamily{\charter}{XCharter}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Common Fonts
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Defines the primary font to use for the headers, 
		% this will set the entire block after the command to the header font.
		%	Usage: {\fontHeader <Header Text>}
		\newcommand*{\fontHeader}{\newComputerModern}%
		
		% Defines the primary font to use for the footer, 
		% this will set the entire block after the command to the footer font.
		%	Usage: {\fontFooter <Footer Text>}
		\newcommand*{\fontFooter}{\newComputerModern}%
		
		% Defines the primary font to use for the body of the documents, 
		% this will set the entire block after the command to the body font.
		%	Usage: {\fontBody <Body Text>}
		\newcommand*{\fontBody}{\charter}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%   Font Sizes
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Defines the extra small font size, 
		% this will set the entire block after the command to the extra small font size.
		%	Usage: {\fontXS <Text>}
		\newcommand*{\fontXS}{\fontsize{6.8pt}{1em}}
		
		% Defines the small font size, 
		% this will set the entire block after the command to the small font size.
		%	Usage: {\fontSM <Text>}
		\newcommand*{\fontSM}{\fontsize{7pt}{1em}}
		
		% Defines the medium font size, 
		% this will set the entire block after the command to the medium font size.
		%	Usage: {\fontMD <Text>} 
		\newcommand*{\fontMD}{\fontsize{8pt}{1em}}
		
		% Defines the large font size, 
		% this will set the entire block after the command to the large font size.
		%	Usage: {\fontLG <Text>}
		\newcommand*{\fontLG}{\fontsize{9pt}{1em}}
		
		% Defines the extra large font size,
		% this will set the entire block after the command to the extra large font size.
		%	Usage: {\fontXL <Text>} 
		\newcommand*{\fontXL}{\fontsize{10pt}{1em}}
		
		% Defines the two times extra large font size,
		% this will set the entire block after the command to the two times extra large font size.
		%	Usage: {\fontTwoXL <Text>}
		\newcommand*{\fontTwoXL}{\fontsize{12pt}{1em}}
		
		% Defines the three times extra large font size,
		% this will set the entire block after the command to the three times extra large font size.
		%	Usage: {\fontThreeXL <Text>}
		\newcommand*{\fontThreeXL}{\fontsize{14pt}{1em}}
		
		% Defines the four times extra large font size, 
		% this will set the entire block after the command to the four times extra large font size.
		%	Usage: {\fontFourXL <Text>}
		\newcommand*{\fontFourXL}{\fontsize{18pt}{1em}}
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%	Text Styles Configuration
% 	TODO Urgent Rename this section and its associated variables to typographies
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	%----------------------------------------------------------------------------------------------------------------------%
	%	Header Text Styles
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
		
		% Defines the full font styling to use for the job seekers name in the header block
		\newcommand*{\styleHeaderName}[1]{%
			{%
				\fontFourXL\fontHeader\bfseries#1%
			}%
		}%
		
		% TODO Move spacing here to header, and create a command in spacings for it
		% Defines the full font styling to use for the job seekers position in the header block
		\newcommand*{\styleHeaderPosition}[1]{%
			\hspace*{0.20em}{%
				\fontTwoXL\fontHeader\bfseries\color{grey}#1%
			}%
		}%
		
		% TODO Move spacing here to header, and create a command in spacings for it
		% Defines the full font styling to use for the job seekers social links in the header block
		\newcommand*{\styleHeaderSocialLink}[1]{%
			\hspace*{0.25em}{%
				\fontXS\fontHeader\color{text}#1%
			}%
		}%
		
		% Defines the full font styling to use for each header in the header block's info section
		\newcommand*{\styleHeaderInfoHeader}{%
			\fontXL\fontBody\bfseries\color{darkText}%
		}%
		
		% Defines the full font styling to use for each item in the header block's info section
		\newcommand*{\styleHeaderInfoItem}{%
			\fontXL\fontBody\color{text}%
		}%
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Footer Text Styles
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Defines the full font styling to use for the left section of the footer
		\newcommand*{\styleFooterLeft}[1]{%
			{%
				\fontMD\fontFooter\scshape\color{lightText}#1%
			}%
		}%
		
		% Defines the full font styling to use for the centre section of the footer
		\newcommand*{\styleFooterCentre}[1]{%
			{%
				\fontMD\fontFooter\scshape\color{lightText}#1%
			}%
		}%
		
		% Defines the full font styling to use for the right section of the footer
		\newcommand*{\styleFooterRight}[1]{%
			{%
				\fontMD\fontFooter\scshape\color{lightText}#1%
			}%
		}%	
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Section and Paragraph Text Styles
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% Defines the full font styling to use for a section's header
		\newcommand*{\styleSectionHeader}[1]{%
			{%
				\fontThreeXL\fontBody\bfseries\color{text}\color{darkGrey}#1%
			}%
		}%
		
			% Defines the full font styling to use for a section's header
		\newcommand*{\styleSectionSubHeader}[1]{%
			{%
				\fontXL\fontBody\bfseries\color{text}\color{darkGrey}#1%
			}%
		}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Education Text Styles
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment 
		% 
		\newcommand*{\styleEducationName}[1]{%
			{%
				\fontXL\fontBody\bfseries\color{darkText}#1%
			}%
		}%
		
		% TODO Comment 
		% 
		\newcommand*{\styleEducationColHeader}{%
			\fontXL\fontBody\bfseries\color{darkText}%
		}%
		
		% TODO Comment 
		% 
		\newcommand*{\styleEducationColContent}{%
			\fontXL\fontBody\color{darkText}%
		}%
	
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Skill Text Styles
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment 
		% Defines the full font styling to use for a skill's type
		\newcommand*{\OldstyleSkillType}[1]{%
			{%
				\fontXL\fontBody\bfseries\color{darkText} #1%
			}%
		}%
		
		% TODO Comment 
		% Defines the full font styling to use for each item in a skill type's list
		\newcommand*{\OldstyleSkillList}[1]{%
			{%
				\fontLG\fontBody\color{text} #1%
			}%
		}%
		
		% TODO Comment 
		% 
		\newcommand*{\styleSkillColHeader}{%
			\fontXL\fontBody\bfseries\color{darkText}%
		}%
		
		% TODO Comment 
		% 
		\newcommand*{\styleSkillColContent}{%
			\fontLG\fontBody\color{text}%
		}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	%	Reference Text Styles
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment 
		% 
		\newcommand*{\styleReferenceName}[1]{%
			{%
				\fontXL\fontBody\bfseries\color{darkText}#1%
			}%
		}%

		% TODO Comment 
		% 
		\newcommand*{\styleRefColHeader}{%
			\fontXL\fontBody\bfseries\color{darkText}%
		}%
		
		% TODO Comment 
		% 
		\newcommand*{\styleRefColContent}{%
			\fontLG\fontBody\color{text}%
		}%
		
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	Structure and Spacing Styles Configuration
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	%----------------------------------------------------------------------------------------------------------------------%
	% 	Section Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Rewrite Comment
		% Defines the skipped space above a section
		\newcommand{\spaceSectionPre}{0.25em}%
		
		% TODO Rewrite Comment
		% Defines the skipped space below a section
		\newcommand{\spaceSectionPost}{0.25em}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Header Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Improve comment
		% TODO Move over to em
		% Defines the spacing object to use for "tabbing" environments in the header
		\newcommand*{\spacingTabbingHeader}{\hspace{3cm} \= \hspace{4cm} \= \kill}%
		
		% TODO Comment
		%
		\newcommand*{\spaceHeaderNamePost}{0.25em}%
		
		% TODO Change to 'em'
		% TODO Comment
		%
		\newcommand{\spaceHeaderPositionPost}{0.4mm}%
		
		% TODO Comment
		% 
		\newcommand{\sepHeaderSocial}{\hskip0.5em\relax}%
		
		% TODO Change to 'em'
		% TODO Comment
		% 
		\newcommand{\sepHeaderSocialIcon}{\space}%
		
		% TODO Comment
		% 
		\newcommand{\divHeaderSocial}{\sepHeaderSocial\textbar\sepHeaderSocial}%
		
		% TODO Change to 'em'
		% TODO Comment
		% 
		\newcommand{\spaceHeaderSocialPost}{0.4mm}%
		
		% TODO Change to 'em'
		% TODO Comment
		% 
		\newcommand{\spaceHeaderInfoItemPost}{0.4mm}%
		
		% TODO Comment
		% 
		\newcommand{\spaceHeaderInfoBlockPost}{0.75em}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Entry Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment
		% 
		\newcommand{\sepEntryPre}{0.5em}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Education Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment
		%
		\newcommand{\spaceEducationPre}{0.0em}%
		
		% TODO Comment
		%
		\newcommand{\spaceEducationEntryPost}{0.75em}%

		% TODO Comment
		%
		\newcommand{\spaceEducationGrades}{0.5em}%
		
		% TODO Comment
		%
		\newcommand{\sepEducationGrades}{0.5em}%
		
		% TODO Comment
		%
		\newcommand{\widthEducationColHeader}{5.5em}%
		
		% TODO Comment
		%
		\newcommand{\sepEducationColHeaderPost}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\sepEducationColGradePost}{0.75em}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Employment Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
		
		% TODO Comment
		%
		\newcommand{\spaceEmploymentPre}{0.0em}%
		
		% TODO Comment
		%
		\newcommand{\spaceEmploymentEntryPost}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\widthEmploymentColHeader}{5.0em}%
		
		% TODO Comment
		%
		\newcommand{\sepEmploymentColHeaderPost}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\spaceEmploymentResponsibility}{0.5em}%
		
		% TODO Comment
		%
		\newcommand{\sepEmploymentResponsibility}{1.5em}%
		
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Volunteering Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment
		%
		\newcommand{\spaceVolunteeringPre}{0.0em}%
		
		% TODO Comment
		%
		\newcommand{\spaceVolunteeringEntryPost}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\widthVolunteeringColHeader}{5.0em}%
		
		% TODO Comment
		%
		\newcommand{\sepVolunteeringColHeaderPost}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\spaceVolunteeringResponsibility}{0.5em}%
		
		% TODO Comment
		%
		\newcommand{\sepVolunteeringResponsibility}{1.5em}%
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Skill Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
	
		% TODO Comment
		% 
		\newcommand{\spaceSkillPre}{0.0em}%
		
		% TODO Comment
		%
		\newcommand{\widthSkillColHeader}{11.75em}%
		
		% TODO Comment
		% 
		\newcommand{\sepSkillColHeaderPost}{0.75em}% 
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%
	% 	Reference Spacing
	%----------------------------------------------------------------------------------------------------------------------%
	%BEGIN_FOLD
		
		% TODO Comment
		%
		\newcommand{\spaceRefPre}{0.0em}%
		
		% TODO Comment
		%
		\newcommand{\spaceRefEntryPost}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\spaceRefNamePost}{0.4em}%
		
		% TODO Comment
		%
		\newcommand{\sepRefContactPre}{0.75em}%
		
		% TODO Comment
		%
		\newcommand{\widthRefColHeader}{4.45em}%
		
		% TODO Comment
		%
		\newcommand{\sepRefColHeaderPost}{0.75em}%
		
	
	%END_FOLD
	%----------------------------------------------------------------------------------------------------------------------%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Tabular Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Helper command to define the general command set to run before each column element is created
	\newcommand{\@columnPreamble}{%
		\arraybackslash\hspace{0pt}%
	}%
	
	% Helper command to define the general command set to run after each column element is created
	\newcommand{\@columnPostscript}{%
		%
	}%
	
	% TODO Add back m{<width>} as a parameter, but if it is undefined then use the others
	% TODO Comment Rewrite
	% Use to align an element of tabular table
	% 
	\newcolumntype{L}[1]{%
		>{\raggedleft#1\@columnPreamble}%
		l%
		<{\@columnPostscript}%
	}%
	
	% TODO Comment
	% 
	\newcolumntype{X}[2]{%
		>{\raggedright#1\@columnPreamble}%
		m{#2}%
		<{\@columnPostscript}%
	}%
	
	% TODO Add back m{<width>} as a parameter, but if it is undefined then use the others
	% TODO Comment Rewrite
	% Use to align an element of tabular table
	%
	\newcolumntype{C}[1]{%
		>{\centering#1\@columnPreamble}%
		c%
		<{\@columnPostscript}%
	}%
	
	% TODO Add back m{<width>} as a parameter, but if it is undefined then use the others
	% TODO Comment Rewrite
	% Use to align an element of tabular table
	%
	\newcolumntype{R}[1]{%
		>{\raggedleft#1\@columnPreamble}%
		r%
		<{\@columnPostscript}%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	Class Options Formatting and Styling 
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Defines how the 'draft' class option affects the document
	\def\@draftDocumentStyle{%
		\setlength\overfullrule{5pt}%
	}%
	
	% Defines how the 'final' class option affects the document
	\def\@finalDocumentStyle{%
		\setlength\overfullrule{0pt}%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	Programmatic Helper Commands
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Displays the provided command if the condition is false
	% 	Usage: \IfNotThen{<Condition>}{<Object to Display>}
	\newcommand{\IfNotThen}[2]{%
		\ifthenelse{#1}{}{#2}%
	}%

	% Checks if the input is defined, if it is then it displays the provided string
	% 	Usage: \IsDefined{<Variable to Check>}{<Object to Display>}
	\newcommand{\IsDefined}[2]{%
		\IfNotThen{\isundefined{#1}}{#2}%
	}%
	
	% TODO Usage
	% Use to execute conditional statements by checking empty string
	% 	Usage: 
	\newcommand*{\IfEmpty}[3]{%
		\ifthenelse{\isempty{#1}}{#2}{#3}%
	}%
	
	% TODO Move
	\newcommand{\reducedstrut}{\vrule width 0pt height .9\ht\strutbox depth .9\dp\strutbox\relax}
	\newcommand{\DebugBox}[2]{%
		\begingroup%  
		\setlength{\fboxsep}{0pt}%  
		\colorbox{#1}{\reducedstrut#2\/}%
		\endgroup%  
	}%  
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   Information Block and Organisational Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% TODO Remove if not needed
	% Command for a square bullet point
	% Usage:  \squareBullet{<width>}{<thickness>}{<leftSpace>}{<raise>}
	% Arguments,
	%    width		(#1)[Optional]{0.8ex}				: Width of the square bullet point
	%    thickness	(#2)[Optional]{width}				: Thickeness of the square bullet point
	%    leftSpace	(#3)[Optional]{1.25ex}				: Space on the left of the square bullet point
	%    raise		(#4)[Optional]{0.1\baselineskip}	: Height above or below the bullet points baseline
	\NewDocumentCommand{\squareBullet}
		{O{0.8ex} O{#1} O{1.25ex} O{0.1\baselineskip}}
		{\hspace{#3}\rule[#4]{#1}{#2}}

	% TODO Rename
	% Environment that displays a list without any indentation
	% Usage:  \begin{noIndentItemize} <itemized list here> \end{noIndentItemize}
	\newenvironment{noIndentItemize}
		{\setlength{\leftmargini}{0em}\begin{itemize}}
		{\end{itemize}}
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	Data Display Commands
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% TODO Comment
	% Command that checks if the email is defined and if valid then returns the email hyperlink
	% 	 Usage: \emailLink{<email>}
	\newcommand{\FormattedEmail}[1]{%
		\IsDefined{#1}{\href{mailto:#1}{#1}}%
	}%
	
	% TODO Comment
	% 
	% 	 Usage: 
	\newcommand{\FormattedDate}[3]{%
		\formatdate{#1}{#2}{#3}%
	}%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	Formatted Data Commands
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% TODO Comment
	% 
	\newcommand{\DateOfBirth}{%
		\FormattedDate{\@dateOfBirthDay}{\@dateOfBirthMonth}{\@dateOfBirthYear}%
	}%

	% TODO Comment
	%
	\newcommand*{\MobileNumber}{%
		\href{\@telUri}{\@mobileNumber}%
	}%

	% TODO Comment
	%
	\newcommand*{\PersonalEmail}{%
		\FormattedEmail{\@personalEmail}%
	}%
	
	% TODO Comment
	%
	\newcommand*{\WorkEmailHead}{%
		\ifbool{bWorkEmail}{Work}{Business} Email%
	}%
	
	% TODO Comment
	%
	\newcommand*{\WorkEmail}{%
		\FormattedEmail{\@workEmail}%
	}%
	
	% TODO Comment
	%
	\newcommand*{\Homepage}{%
		\href{http://\@homepage}{\faHome\sepHeaderSocialIcon\@homepage}%
	}%
	
	% TODO Comment
	%
	\newcommand*{\GitHub}{%
		\href{https://github.com/\@gitHub}{\faGithubSquare\sepHeaderSocialIcon\@gitHub}%
	}%
	
	% TODO Comment
	%
	\newcommand*{\GitLab}{%
		\href{https://gitLab.com/\@gitLab}{\faGitlab\sepHeaderSocialIcon\@gitLab}%
	}%
	
	% TODO Comment
	%
	\newcommand*{\LinkedIn}{%
		\href{https://www.linkedin.com/in/\@linkedIn}{\faLinkedin\sepHeaderSocialIcon\@linkedIn}%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%   CV Structure Blocks Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% TODO Add in params for pre vspace, and width
	% TODO Add in params for post vspace
	% TODO Add in params for width
	% Creates a horizontal rule that is used to seperate sections
	% 	Usage: \cvHRule
	\newcommand{\cvHRule}{%
		\rule{\textwidth}{0.5mm}%
	}%
	
	% TODO Add in row spacing
	% TODO Comment
	% 
	% 	Usage: 
	\newcommand{\headerSecondaryTabbing}[3]{%
		\begin{minipage}{0.5\linewidth}%
			\setlength\tabcolsep{0.0pt}\setlength{\extrarowheight}{0.0pt}%
			\begin{tabular*}{\linewidth}{%
					X{\styleHeaderInfoHeader}{#1}%
					@{\hskip#2}%
					X{\styleHeaderInfoItem}{%
						\linewidth-#1-#2%
					}%
				}% 
				#3% 
			\end{tabular*}% 
		\end{minipage}% 
	}%
	
	% TODO Clean up spacings
	% Defines and creates the header for the CV
	%   Usage: \CVHeader
	\newcommand*{\CVHeader}{%														
		\IsDefined{\@name}{%							Name Block
			\styleHeaderName{\@name}%	
			\\[\spaceHeaderNamePost]%
		}%
		\IsDefined{\@position}{%						Job Position Block
			\styleHeaderPosition{\@position}%
			\\[\spaceHeaderPositionPost]%					
		}%	
		\styleHeaderSocialLink{%						Socials Block
			\newbool{bStart}\setbool{bStart}{true}%			Creates conditional to check if social is start of list
			\IsDefined{\@homepage}{%						Homepage/Portfolio Block
				\ifbool{bStart}%
					{\setbool{bStart}{false}}%
					{\divHeaderSocial}%
				\Homepage%
			}%
			\IsDefined{\@gitHub}{%							GitHub
				\ifbool{bStart}%
					{\setbool{bStart}{false}}%
					{\divHeaderSocial}%
				\GitHub%
			}%
			\IsDefined{\@gitLab}{%							GitLab
				\ifbool{bStart}%
					{\setbool{bStart}{false}}%
					{\divHeaderSocial}%
				\GitLab%
			}%
			\IsDefined{\@linkedIn}{%						LinkedIn
				\ifbool{bStart}%
					{\setbool{bStart}{false}}%
					{\divHeaderSocial}%
				\LinkedIn%
			}%
		}\\[\spaceHeaderSocialPost]%
		\cvHRule\\[0.75em]%
		\headerSecondaryTabbing{6em}{0.75em}{%						Personal Info Block
			\IsDefined{\@addressCity}{% 					City Block
				City &%
				\@addressCity%
				\\[\spaceHeaderInfoItemPost]%
 			}%
			\IfNotThen{% 									Date of Birth Block
				\isundefined{\@dateOfBirthDay}%
				\OR \isundefined{\@dateOfBirthMonth}%
				\OR \isundefined{\@dateOfBirthYear}%
			}{%
				Date of Birth &%
				\DateOfBirth%
			}%
		}%
		\hfill%
		\headerSecondaryTabbing{7em}{0.75em}{%						Contact Info Block
			\IsDefined{\@mobileNumber}{% 					Mobile Number Block
				Mobile Phone &%
				\MobileNumber%
				\\[\spaceHeaderInfoItemPost]%
			}%			
			\IsDefined{\@personalEmail}{% 					Personal Email Block
				Personal Email &%
				\PersonalEmail%
				\\[\spaceHeaderInfoItemPost]%
			}%							
			\IsDefined{\@workEmail}{% 						Work Email Block
				\WorkEmailHead &%
				\WorkEmail%
			}%		
		}\\[\spaceHeaderInfoBlockPost]%						Post Block Vertical Space																
		\cvHRule%
	}
	
	% Defines a CV section, this creates the header and defines it in the TOC/Document Outline
	%	Usage: \CVSection{<Section Title>}
	\newcommand{\CVSection}[1]{%
		\vspace*{\spaceSectionPre}%
		\styleSectionHeader{#1}%
		\phantomsection%										
		\addcontentsline{toc}{section}{#1}%
		\vspace*{\spaceSectionPost}%
	}%	

	% Defines and creates the footer that the CV will use
	% 	Usage: 
	\newcommand*{\CVFooter}{%
		\fancyfoot{}%
		\fancyfoot[L]{\styleFooterLeft{\today}}%
		\fancyfoot[C]{\styleFooterCentre{}}%
		\fancyfoot[R]{\styleFooterRight{\thepage\space of \pageref{LastPage}}}%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%    Education Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Define an environment that formats the education history entries for the CV
	\newenvironment{EducationEntries}{%
		\setlength{\leftmargini}{\sepEntryPre}%
		\vspace{\spaceEducationPre}%
		\begin{itemize}[label={}]{%
				\setlength\itemsep{\spaceEducationEntryPost}%
			}%
	}%
	{%
		\end{itemize}%
	}%

	% Defines and styles a specific education entry.
	% 	Usage: \EducationEntry{<Degree>}{<Institution>}{<Website>}{<Start Date>}{<End Date>}{<description>}
	\newcommand*{\EducationEntry}[6]{%
		\item{%
			\setlength\tabcolsep{0.0pt}\setlength{\extrarowheight}{0.0pt}%
			\begin{tabular*}{\linewidth}{%
					X{\styleEducationColHeader}{\widthEducationColHeader}%
					@{\hskip\sepEducationColHeaderPost}%
					X{\styleEducationColContent}{%
						\linewidth-\widthEducationColHeader-\sepEducationColHeaderPost%
					}%
				}% 
				#4 - #5&#1 - \href{#3}{#2}\\[\spaceEducationGrades]% 
				&{%
					\begin{tabular*}{\linewidth}{%
							>{\hspace{\sepEducationGrades}}L{\styleEducationColContent}%
							@{\hskip\sepEducationColGradePost}%
							L{\styleEducationColContent}%
						}%
						#6%
					\end{tabular*}%
				}%
			\end{tabular*}%
		}%
	}%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%    Employment History Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD
	
	% Define an environment that formats the employment history entries for the CV
	\newenvironment{EmploymentHistoryEntries}{%
		\setlength{\leftmargini}{\sepEntryPre}%
		\vspace{\spaceEmploymentPre}%
		\begin{itemize}[label={}]{%
			\setlength\itemsep{\spaceEmploymentEntryPost}%
		}%
	}%
	{%
		\end{itemize}%
	}%
	
	% Defines and styles a specific job role from your employment history.
	% 	Usage: \EmploymentHistoryEntry{<Job Title>}{<Start Date>}{<End Date>}{<Company>}{<Company Website>}{<Responsibilities>}
	\newcommand{\EmploymentHistoryEntry}[6]{%
		\item{%
			\setlength\tabcolsep{0.0pt}\setlength{\extrarowheight}{0.0pt}%
			\begin{tabular*}{\linewidth}{%
					X{\styleRefColHeader}{\widthEmploymentColHeader}%
					@{\hskip\sepEmploymentColHeaderPost}%
					X{\styleRefColContent}{%
						\linewidth-\widthEmploymentColHeader-\sepEmploymentColHeaderPost%
					}%
				}%
				#2 - & \href{#5}{#4}\\%
				#3 & #1\\[\spaceEmploymentResponsibility]%
				&{%
					\begin{minipage}{\linewidth}%
						\setlength{\leftmargini}{\sepEmploymentResponsibility}%
						\begin{itemize}[label=\bullet]%
							#6%
						\end{itemize}%
					\end{minipage}%
				}%
			\end{tabular*}%
		}%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%    Volunteering Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD
	
	% Define an environment that formats the volunteer role entries for the CV
	\newenvironment{VolunteerRoleEntries}{%
		\setlength{\leftmargini}{\sepEntryPre}%
		\vspace{\spaceVolunteeringPre}%
		\begin{itemize}[label={}]{%
			\setlength\itemsep{\spaceVolunteeringEntryPost}%
		}%
	}%
	{%
		\end{itemize}%
	}%

	% Defines and styles a specific volunteer role.
	% 	Usage: \VolunteerRoleEntry{<Role Title>}{<Start Date>}{<End Date>}{<Company>}{<Company Website>}{<Responsibilities>}
	\newcommand{\VolunteerRoleEntry}[6]{%
		\item{%
			\setlength\tabcolsep{0.0pt}\setlength{\extrarowheight}{0.0pt}%
			\begin{tabular*}{\linewidth}{%
					X{\styleRefColHeader}{\widthVolunteeringColHeader}%
					@{\hskip\sepVolunteeringColHeaderPost}%
					X{\styleRefColContent}{%
						\linewidth-\widthVolunteeringColHeader-\sepVolunteeringColHeaderPost%
					}%
				}%
				#2 - & \href{#5}{#4}\\%
				#3 & #1\\[\spaceVolunteeringResponsibility]%
				&{%
					\begin{minipage}{\linewidth}%
						\setlength{\leftmargini}{\sepVolunteeringResponsibility}%
						\begin{itemize}[label=\bullet]%
							#6%
						\end{itemize}%
					\end{minipage}%
				}%
			\end{tabular*}%
		}%
	}%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%    Skills Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD
	
	% Define an environment that formats the Skill Groups for the CV
	\newenvironment{SkillGroups}{%
		\vspace{\spaceSkillPre}\hspace*{\sepEntryPre}%
		\begin{minipage}{\textwidth-\sepEntryPre}%
			\setlength\tabcolsep{0.0pt}\setlength{\extrarowheight}{0.0pt}%
			\begin{tabular*}{\linewidth}{%
					X{\styleSkillColHeader}{\widthSkillColHeader}%
					@{\hskip\sepSkillColHeaderPost}%
					X{\styleSkillColContent}{%
						\linewidth-\widthSkillColHeader-\sepSkillColHeaderPost%
					}%
				}%
	}%
	{%
			\end{tabular*}%
		\end{minipage}%
	}%

	% Defines and styles a group of skills
	% 	Usage: \SkillGroup{<Skill Category>}{<Skill Set>}
	\newcommand*{\SkillGroup}[2]{%
		#1 & #2\\%
	}%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%    References Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Define an environment that formats the reference entries
	\newenvironment{ReferenceEntries}{%
		\setlength{\leftmargini}{\sepEntryPre}%
		\vspace{\spaceRefPre}%
		\begin{itemize}[label={}]{%
				\setlength\itemsep{\spaceRefEntryPost}%
			}%
	}%
	{%
		\end{itemize}%
	}%
	
	% Defines and styles a single reference block
	% 	Usage: \ReferenceEntry{<Referee Name>}{<Referee Company>}{<Referee Relative Position}{<Referee Email>}\textbf{}
	\newcommand{\ReferenceEntry}[4]{% 
		\item{%
			\styleReferenceName{#1}\\[\spaceRefNamePost]%
			\hspace*{\sepRefContactPre}%
			\begin{minipage}{\linewidth-\sepRefContactPre}%
				\setlength\tabcolsep{0.0pt}\setlength{\extrarowheight}{0.0pt}%
				\begin{tabular*}{\linewidth}{%
						X{\styleRefColHeader}{\widthRefColHeader}%
						@{\hskip\sepRefColHeaderPost}%
						X{\styleRefColContent}{%
							\linewidth-\widthRefColHeader-\sepRefColHeaderPost%
						}%
					}%
					Company & #2\\%
					Position & #3%
					\IfEmpty{#4}{}{%
						\\Contact & \FormattedEmail{#4}%
					}% 	
				\end{tabular*}%
			\end{minipage}%
		}\\%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
% 	 Debug Commands and Environments
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Displays the debug information for the class and document
	%	Usage: \DisplayDebugInformation
	\newcommand*{\DisplayDebugInformation}{%
		\textbf{Breached CV Debug Information}\\
		\textbf{Class information}
		\textbf{Basic}
		\begin{tabbing}
			\hspace{3em} \= \kill
			\textbf{Name:} \> \breachedcv@className\\
			\textbf{Label:} \> \breachedcv@classLabel
		\end{tabbing}
		\textbf{Semantic Version}
		\begin{tabbing}
			\hspace{6em} \= \kill
			\textbf{Number} \> \breachedcv@classVersion\\% 				Semantic Version Number
			\textbf{Release Date} \> \breachedcv@classReleaseDate%			Version Release Date
		\end{tabbing}
		\textbf{Document information}\\
		\textbf{Options}
		\begin{tabbing}
			\hspace{6em} \= \kill
			\textbf{Debug} \> {\IfShowDebug{True}{False}}\\%	Debug state
			\textbf{Draft/Final} \> {%							Draft/Final state
				\if@draft Draft%
				\else {%
						\if@final Final %
						\else Error \fi%
				}\fi%
			}\\%
			\textbf{Doc Subtype} \> {%							Document Subtype state
				\IfDocumentSubtype%
				{CV}%
				{Cover Letter}%
				{Personal Statement}%
				{Error}%
			}\\%
		\end{tabbing}%
	}%

%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
%    Document Hooks and Overrides
%----------------------------------------------------------------------------------------------------------------------%
%BEGIN_FOLD

	% Runs any document formatting that needs to go at the top of the document environemt
	\AtBeginDocument{%
		\if@draft\@draftDocumentStyle\fi%			Enable the "draft" options styling for the document
		\if@final\@finalDocumentStyle\fi%			Enable the "final" options styling for the document
		\if@bShowDebug\DisplayDebugInformation\fi%	Displays the debug data if we are in debug
		\newpage
		\IfDocumentSubtype%							Create the format required for each document subtype
			{%										CV subtype
				\CVFooter%								Set correct footer for subtype
				\CVHeader%								Set correct header for subtype
			}%
			{%										Cover letter subtype
			}%
			{%										Personal statement subtype	
			}%
			{%										Error state
			}%
	}%
	
%END_FOLD
%----------------------------------------------------------------------------------------------------------------------%
