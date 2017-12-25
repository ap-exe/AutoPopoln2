unit addtabform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls;

type

  { TAddTabForm1 }

  TAddTabForm1 = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    NameTabEdit: TLabeledEdit;
    FileTabEdit: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    OpenFileButton: TSpeedButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure OpenFileButtonClick(Sender: TObject);
  private

  public
    //NameTab, FileName: string;
  end;

var
  AddTabForm1: TAddTabForm1;

implementation

{$R *.frm}

{ TAddTabForm1 }

procedure TAddTabForm1.OpenFileButtonClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    FileTabEdit.Text := OpenDialog1.FileName;
end;

procedure TAddTabForm1.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAddTabForm1.OKButtonClick(Sender: TObject);
begin
  Hide;
end;

end.

