/// <summary>
/// ***************************************************************************
///
/// DAD48
///
/// Copyright 2021-2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// File last update : 2025-03-09T16:53:28.000+01:00
/// Signature : b7b56fded63a0c38e447e854f65b75c810699a85
/// ***************************************************************************
/// </summary>

unit uSoundEffects;

interface

type
{$SCOPEDENUMS ON}
  TSoundEffectType = (None, PartiePerdue, SortieTrouvee, RamassagePiece,
    RamassageHelp, RamassageCle, RamassagePotion, KonamiCodeactive);

  TSoundEffects = class;
  TSoundEffectsClass = class of TSoundEffects;

  TSoundEffects = class
  private
  protected
    class procedure RegisterSounds;
  public
    class procedure Play(const Sound: TSoundEffectType);
    class procedure StopAll;
    class procedure Volume(AVolume: integer);
    class function Current: TSoundEffectsClass;
  end;

implementation

{ TSoundEffects }

uses
  uConfig,
  Gamolf.FMX.MusicLoop,
  System.SysUtils,
  System.IOUtils,
  uConsts;

class procedure TSoundEffects.StopAll;
begin
  TSoundList.Current.MuteAll;
end;

class function TSoundEffects.Current: TSoundEffectsClass;
begin
  result := TSoundEffects;
end;

class procedure TSoundEffects.Play(const Sound: TSoundEffectType);
begin
  if tconfig.Current.SoundEffectsOnOff then
    TSoundList.Current.Play(ord(Sound));
end;

class procedure TSoundEffects.RegisterSounds;
var
  Sound: TSoundEffectType;
  Folder, FileName, FilePath: string;
begin
{$IF defined(ANDROID)}
  // deploy in .\assets\internal\
  Folder := tpath.GetDocumentsPath;
{$ELSEIF defined(MSWINDOWS)}
  // deploy in .\
{$IFDEF DEBUG}
  Folder := CDefaultSoundEffectsPath;
{$ELSE}
  Folder := extractfilepath(paramstr(0));
{$ENDIF}
{$ELSEIF defined(IOS)}
  // deploy in .\
  Folder := extractfilepath(paramstr(0));
{$ELSEIF defined(MACOS)}
  // deploy in Contents\MacOS
  Folder := extractfilepath(paramstr(0));
{$ELSEIF Defined(LINUX)}
  // deploy in .\
  Folder := extractfilepath(paramstr(0));
{$ELSE}
{$MESSAGE FATAL 'OS non support�'}
{$ENDIF}
  for Sound := low(TSoundEffectType) to high(TSoundEffectType) do
  begin
    case Sound of
      TSoundEffectType.None:
        FileName := '';
      TSoundEffectType.PartiePerdue:
        FileName := 'Pain.wav';
      TSoundEffectType.SortieTrouvee:
        FileName := 'DoorWoodOpen.wav';
      TSoundEffectType.RamassagePiece:
        FileName := 'GUIOkay.wav';
      TSoundEffectType.RamassageHelp:
        FileName := 'On2.wav';
      TSoundEffectType.RamassageCle:
        FileName := 'LockboltOpen.wav';
      TSoundEffectType.RamassagePotion:
        FileName := 'MinorPickup.wav';
      TSoundEffectType.KonamiCodeactive:
        FileName := 'Computer.wav';
    else
      raise Exception.Create('Missing a sound effect !');
    end;
    if (not FileName.isempty) then
    begin
      FilePath := tpath.combine(Folder, FileName);
      if tfile.exists(FilePath) then
        TSoundList.Current.add(ord(Sound), FilePath);
    end;
  end;
  TSoundList.Current.Volume := tconfig.Current.SoundEffectsVolume;
end;

class procedure TSoundEffects.Volume(AVolume: integer);
begin
  if AVolume in [0 .. 100] then
  begin
    TSoundList.Current.Volume := AVolume;
    if tconfig.Current.SoundEffectsVolume <> AVolume then
      tconfig.Current.SoundEffectsVolume := AVolume;
  end;

end;

initialization

TSoundEffects.RegisterSounds;

end.
