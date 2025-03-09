/// <summary>
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
/// File last update : 2025-03-09T20:05:02.000+01:00
/// Signature : 1153fc045d7232fd3499f84cf2b18a2e7bfe2f33
/// ***************************************************************************
/// </summary>

unit fSceneTest;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  _ScenesAncestor,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation;

type
  TSceneTest = class(T__SceneAncestor)
    FlowLayout1: TFlowLayout;
    Button1: TButton;
    VertScrollBox1: TVertScrollBox;
    procedure Button1Click(Sender: TObject);
  private
  public
    procedure ShowScene; override;
  end;

implementation

{$R *.fmx}

uses
  System.Messaging,
  uConsts,
  uScene,
  uSVGBitmapManager_InputPrompts,
  USVGSprites,
  USVGBoutons;

{ TSceneTest }

procedure TSceneTest.Button1Click(Sender: TObject);
begin
  tscene.Current := tscenetype.Exit;
end;

procedure TSceneTest.ShowScene;
var
  i, j: integer;
  img: timage;
  tab: array of word;
  y: single;
begin
  inherited;
  y := 0;
  tab := [16, 32, 64, 128, 256, 512];
  for j := 0 to length(tab) - 1 do
  begin
    for i := 0 to TSVGSprites.Count - 1 do
    begin
      img := timage.Create(self);
      img.parent := FlowLayout1;
      img.Width := tab[j];
      img.height := img.Width;
      img.Bitmap.assign(getBitmapFromSVG(TSVGSpritesIndex(i), tab[j],
        tab[j], 1));
      if y < img.position.y + img.height then
        y := img.position.y + img.height;
    end;
    for i := 0 to TSVGBoutons.Count - 1 do
    begin
      img := timage.Create(self);
      img.parent := FlowLayout1;
      img.Width := tab[j];
      img.height := img.Width;
      img.Bitmap.assign(getBitmapFromSVG(TSVGBoutonsIndex(i), tab[j],
        tab[j], 1));
      if y < img.position.y + img.height then
        y := img.position.y + img.height;
    end;
  end;
  FlowLayout1.height := y;
end;

initialization

TMessageManager.DefaultManager.SubscribeToMessage(TSceneFactory,
  procedure(const Sender: TObject; const Msg: TMessage)
  var
    NewScene: TSceneTest;
  begin
    if (Msg is TSceneFactory) and
      ((Msg as TSceneFactory).SceneType = tscenetype.tests) then
    begin
      NewScene := TSceneTest.Create(application.mainform);
      NewScene.parent := application.mainform;
      tscene.RegisterScene(tscenetype.tests, NewScene);
    end;
  end);

end.
