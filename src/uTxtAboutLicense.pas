﻿/// <summary>
/// ***************************************************************************
///
/// DAD48
///
/// Copyright 2021-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://dad48.gamolf.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/DAD48
///
/// ***************************************************************************
/// File last update : 2025-03-09T17:05:50.000+01:00
/// Signature : 589b15e08abba482c0fc1516448a69b9ce5aee06
/// ***************************************************************************
/// </summary>

unit uTxtAboutLicense;

interface

function GetTxtAboutLicense(const Language: string;
  const Recursif: boolean = false): string;

implementation

// For the languages codes, please use 2 letters ISO codes
// https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes

uses
  System.SysUtils,
  uConsts;

const
  CTxtEN = '''
This program is distributed as shareware. If you use it (especially for commercial or income-generating purposes), please remember the author and contribute to its development by purchasing a license.

This software is supplied as is, with or without bugs. No warranty is offered as to its operation or the data processed. Make backups!

''';
  CTxtFR = '''
Ce programme est distribué en tant que shareware. Si vous l'utilisez (en particulier à des fins commerciales ou rémunératrices), merci de vous souvenir de l'auteur et de contribuer à son développement en achetant une licence.

Ce logiciel est fourni tel quel, avec ou sans bogues. Aucune garantie n'est offerte quant à son fonctionnement ou aux données traitées. Faites des sauvegardes !

''';
  // CTxtIT = '';
  // CTxtDE = '';
  // CTxtJP = '';
  // CTxtPT = '';
  // CTxtES = '';

function GetTxtAboutLicense(const Language: string;
  const Recursif: boolean): string;
var
  lng: string;
begin
  lng := Language.tolower;
  if (lng = 'en') then
    result := CTxtEN
  else if (lng = 'fr') then // France
    result := CTxtFR
  else if not Recursif then
    result := GetTxtAboutLicense(CDefaultLanguage, true)
  else
    raise Exception.Create('Unknow license for language "' + Language + '".');
end;

end.

