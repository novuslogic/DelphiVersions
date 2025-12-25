# Delphi Versions Include File

A Delphi [include file](https://docwiki.embarcadero.com/RADStudio/en/Include_file_(Delphi)) of Delphi version [compiler directives](https://docwiki.embarcadero.com/RADStudio/en/Delphi_Compiler_Directives_(List)_Index) to simplify [conditional compilation](https://docwiki.embarcadero.com/RADStudio/en/Conditional_compilation_(Delphi)) based on [compiler version](https://docwiki.embarcadero.com/RADStudio/en/Conditional_compilation_(Delphi)).
Supporting from **Delphi 2007** through **Delphi 13 *Florence***.

## Including in Your Project

You can use [Git's submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) support to include the latest `DelphiVersions.inc` automatically in your project's Git repo (it doesn't even need to be on GitHub).

### Scripted Install

There is a [polygot script](https://github.com/jimmckeeth/DelphiVersions/blob/master/update_delphiversions.cmd) that *should* work in PowerShell, CMD, & Bash to add it as a submodule, and running it later will update to the latest version. 

In a hurry? You can use the following one-liner to install it. Just run this from a terminal in your repository (`curl` is available on Windows 10 an newer, and most all Linux distros.)

From a **Command Prompt** (not PowerShell)

```cmd
curl -LO "https://raw.githubusercontent.com/jimmckeeth/DelphiVersions/master/update_delphiversions.cmd" && update_delphiversions.cmd && del update_delphiversions.cmd
```

From **PowerShell** terminal (not *CMD.exe*)

```pwsh
iwr -useb 'https://raw.githubusercontent.com/jimmckeeth/DelphiVersions/master/update_delphiversions.cmd' -OutFile 'update_delphiversions.cmd'; ./update_delphiversions.cmd; rm update_delphiversions.cmd
```

From **Bash** / WSL / Git Bash

```bash
curl -fsSL https://raw.githubusercontent.com/jimmckeeth/DelphiVersions/master/update_delphiversions.cmd | sh
```

### Manual Install

If you want to install it manually, run the following git commands in your repo:

```cmd
git submodule add https://github.com/jimmckeeth/DelphiVersions.git DelphiVersions
git submodule update --remote --merge DelphiVersions
```

And then in the when you want to update `DelphiVersions.inc` just repeat the last line

```cmd
git submodule update --remote --merge DelphiVersions
```

or just run [`update_delphiversions.cmd`](https://github.com/jimmckeeth/DelphiVersions/blob/master/update_delphiversions.cmd) again.

### Troubleshooting

Git submodules are configured through the `.gitmodules` file in the root of your respository. After the above steps it should look something like:

```ini
[submodule "DelphiVersions"]
        path = DelphiVersions
        url = https://github.com/jimmckeeth/DelphiVersions.git
```

If you have trouble you can remove those lines and delete the folder and try again. Or [read the docs](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## Directivies & Usage

If your code requires a feature introduced in Delphi 10.0 then you would use

```delphi
{$I DelphiVersions\DelphiVersions.inc}

{$IFDEF DELPHI10_UP}
// Your fancy code
{$ENDIF}
```

Here is a list of directives defined:

| Directivies     | Description                                                |
| --------------- | ---------------------------------------------------------- |
| `DELPHI13_UP`   | Delphi 13 Florence / C++Builder 12 Florence / D30 or higher|
| `DELPHI13`      | Delphi 13 Florence / C++Builder 12 Florence / D30          |
| `DELPHI12_UP`   | Delphi 12 Athens / C++Builder 12 Athens / D29 or higher    |
| `DELPHI12`      | Delphi 12 Athens / C++Builder 12 Athens / D29              |
| `DELPHI11_UP`   | Delphi 11 Alexandria / C++Builder Sydney / D28 or higher   |
| `DELPHI11`      | Delphi 11 Alexandria / C++Builder Sydney / D28             |
| `DELPHI10_4_UP` | Delphi 10.4 Sydney / C++Builder Sydney / D27 or higher     |
| `DELPHI10_4`    | Delphi 10.4 Sydney / C++Builder Sydney / D27               |
| `DELPHI10_3_UP` | Delphi 10.3 Rio / C++Builder Rio / D26 or higher           |
| `DELPHI10_3`    | Delphi 10.3 Rio / C++Builder Rio / D26 or higher           |
| `DELPHI10_2_UP` | Delphi 10.2 Tokyo / C++Builder Tokyo / D25 or higher       |
| `DELPHI10_2`    | Delphi 10.2 Tokyo / C++Builder Tokyo / D25                 |
| `DELPHI10_1_UP` | Delphi 10.1 Berlin / C++Builder Berlin / D24 or higher     |
| `DELPHI10_1`    | Delphi 10.1 Berlin / C++Builder Berlin / D24               |
| `DELPHI10_UP`   | Delphi 10 Seattle / C++Builder Seattle or higher / D23     |
| `DELPHI10`      | Delphi 10 Seattle / C++Builder Seattle / D23               |
| `DELPHIXE8_UP`  | Delphi XE8 / C++Builder XE8 / D22 or higher                |
| `DELPHIXE8`     | Delphi XE8 / C++Builder XE8 / D22                          |
| `DELPHIXE7_UP`  | Delphi XE7 / C++Builder XE7 / D21 or higher                |
| `DELPHIXE7`     | Delphi XE7 / C++Builder XE7 / D21                          |
| `DELPHIXE6_UP`  | Delphi XE6 / C++Builder XE6 / D20 or higher                |
| `DELPHIXE6`     | Delphi XE6 / C++Builder XE6 / D20                          |
| `DELPHIXE5`     | Delphi XE5 / C++Builder XE5 / D19                          |
| `DELPHIXE4`     | Delphi XE4 / C++Builder XE4 / D18                          |
| `DELPHIXE3`     | Delphi XE3 / C++Builder XE3 / D17                          |
| `DELPHIXE2`     | Delphi XE2 / C++Builder XE2 / D16                          |
| `DELPHIXE`      | Delphi XE / C++Builder XE (Win32) / D15                    |
| `DELPHI2010`    | Delphi 2010 / C++Builder 2010 (Win32) / D16                |
| `DELPHI2009_UP` | Delphi 2009 / C++Builder 2009 (Win32) D15 or higher        |
| `DELPHI2009`    | Delphi 2009 / C++Builder 2009 (Win32) D15                  |
| `DELPHI2007_1`  | Delphi 2007 / C++Builder 2007 Update 1 for Win32 D14       |
| `DELPHI2007`    | Delphi 2007 / C++Builder 2007 for Win32 D14                |

