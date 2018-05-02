unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

uses
  MyFileUtils;

{$R *.frm}

{ TAboutForm }

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Label1.Caption:='EditBases'+#13#10+FileVersion(Application.ExeName)+
    #13#10+'Freeware (C) 2012-2018';
end;

procedure TAboutForm.FormClick(Sender: TObject);
begin
  Close;
end;

end.

