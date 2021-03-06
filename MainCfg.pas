unit MainCfg;

interface

function SaveCfg: boolean;
function LoadCfg: boolean;

implementation

uses
  Main, Registry, SysUtils, Graphics, Variants, Dialogs, Forms;

var
  r: TRegistry;

// парсинг строки S в которой присутствует разделитель Char
// Count указывает на позицию
function Parse(Char, S: string; Count: Integer): string;
var
  I: Integer;
  T: string;
begin
  if S[Length(S)] <> Char then
    S := S + Char;
  for I := 1 to Count do
  begin
    T := Copy(S, 0, Pos(Char, S) - 1);
    S := Copy(S, Pos(Char, S) + 1, Length(S));
  end;
  Result := T;
end;

// функция сохраняет параметры программы в реестре
function SaveCfg: boolean;
var
  i, dpi: integer;
  s: string;
begin
  Result:=False;
  if MainForm.DirConsEdit.Text<>'' then begin
    r:=TRegistry.Create;
    try
      r.RootKey:=HKEY_CURRENT_USER;
      if r.OpenKey('Software\AutoPopoln', True) then begin
        r.WriteString('NameOrg', MainForm.NameOrgEdit.Text);

        r.WriteBool('CopyPopoln', MainForm.PopolnCheckBox.Checked);
        r.WriteString('DirPopoln', MainForm.PopolnEdit.Text);

        r.WriteString('DirCons', MainForm.DirConsEdit.Text);

        r.WriteString('WorkDir', MainForm.WorkDirEdit.Text);

        r.WriteBool('CopyUSR', MainForm.USRCheckBox.Checked);
        r.WriteString('USRDir', MainForm.USRDirEdit.Text);

        r.WriteBool('CopySTT', MainForm.STTCheckBox.Checked);
        r.WriteString('STTDir', MainForm.STTEdit.Text);

        r.WriteBool('CreateSubDir', MainForm.cbCreateSubDir.Checked);
        r.WriteString('KeyCmd', MainForm.KeyCmdEdit.Text);
        r.WriteBool('CloseProg', MainForm.cbCloseProg.Checked);
        s:='';
        for i := 0 to MainForm.ListBases.Items.Count - 1 do begin
          if MainForm.ListBases.Items[i].Checked then
            s:=s+MainForm.ListBases.Items[i].SubItems[1]+',';
        end;
        r.WriteString('PopolnBases', Copy(s, 0, Length(s)-1));
        for i:=0 to MainForm.DatePopoln.Count-1 do
          r.WriteString(IntToStr(i+1)+'_Popoln', MainForm.DatePopoln[i]);
        // сохранение положения окна
        dpi:=1;
        if Screen.PixelsPerInch = 120 then dpi:=125;
        if Screen.PixelsPerInch = 144 then dpi:=150;

        r.WriteInteger('Width', MainForm.Width div dpi);
        r.WriteInteger('Height', MainForm.Height div dpi);
        r.WriteInteger('Top', MainForm.Top);
        r.WriteInteger('Left', MainForm.Left);
        r.WriteInteger('WindowState', integer(MainForm.WindowState));

        r.WriteBool('DisableResizeWindow', MainForm.DisableResizeWindowCB.Checked);
       end
      else Exit(False);
    finally
      r.Free;
    end;
    Result:=True;
  end;
end;

// функция загрузки параметров программы
function LoadCfg: boolean;
var
  i, p: integer;
  s, b: string;
begin
  Result:=True;
  r:=TRegistry.Create;
  try
    r.RootKey:=HKEY_CURRENT_USER;
    if r.OpenKey('Software\AutoPopoln', False) then begin
      if r.ValueExists('NameOrg') then
        MainForm.NameOrgEdit.Text:=r.ReadString('NameOrg')
      else
        MainForm.NameOrgEdit.Text:='';

      if r.ValueExists('CopyPopoln') and r.ValueExists('DirPopoln') then begin
        MainForm.PopolnCheckBox.Checked:=r.ReadBool('CopyPopoln');
        MainForm.PopolnEdit.Text:=r.ReadString('DirPopoln');
      end
      else begin
        MainForm.PopolnEdit.Text:='';
        MainForm.PopolnCheckBox.Checked:=false;
      end;
      MainForm.PopolnCheckBoxClick(nil);

      if r.ValueExists('DirCons') then begin
        MainForm.DirConsEdit.Text:=r.ReadString('DirCons');
        MainForm.FillTableBase;
        MainForm.UnselectAllBasesClick(nil);
      end
      else
        MainForm.DirConsEdit.Text:='';

      if r.ValueExists('WorkDir') then
        MainForm.WorkDirEdit.Text:=r.ReadString('WorkDir')
      else
        MainForm.WorkDirEdit.Text:='';

      if r.ValueExists('CopyUSR') and r.ValueExists('USRDir') then begin
        MainForm.USRCheckBox.Checked:=r.ReadBool('CopyUSR');
        MainForm.USRDirEdit.Text:=r.ReadString('USRDir');
      end
      else
        MainForm.USRCheckBox.Checked:=false;
      MainForm.USRCheckBoxClick(nil);

      if r.ValueExists('CreateSubDir') then begin
        MainForm.cbCreateSubDir.Checked:=r.ReadBool('CreateSubDir');
        MainForm.cbCreateSubDirClick(nil);
      end
      else
        MainForm.cbCreateSubDir.Checked:=True;

      if r.ValueExists('CopySTT') and r.ValueExists('STTDir') then begin
        MainForm.STTCheckBox.Checked:=r.ReadBool('CopySTT');
        MainForm.STTEdit.Text:=r.ReadString('STTDir');
      end
      else begin
        MainForm.STTEdit.Text:='';
        MainForm.STTCheckBox.Checked:=false;
      end;
      MainForm.STTCheckBoxClick(nil);

      if r.ValueExists('KeyCmd') then
        MainForm.KeyCmdEdit.Text:=r.ReadString('KeyCmd')
      else
        MainForm.KeyCmdEdit.Text:='/adm /receive /base* /yes';
      if r.ValueExists('CloseProg') then
        MainForm.cbCloseProg.Checked:=r.ReadBool('CloseProg')
      else
        MainForm.cbCloseProg.Checked:=false;

      // читаем положение окна
      if r.ValueExists('Top') then MainForm.Top:=r.ReadInteger('Top');
      if r.ValueExists('Left') then MainForm.Left:=r.ReadInteger('Left');

      if r.ValueExists('WindowState') then
        MainForm.WindowState:=TWindowState(r.ReadInteger('WindowState'));
      if MainForm.Top < 0 then MainForm.Top:=0;
      if MainForm.Left < 0 then MainForm.Left:=0;

      if r.ValueExists('DisableResizeWindow') then begin
        MainForm.DisableResizeWindowCB.Checked := r.ReadBool('DisableResizeWindow');
        MainForm.DisableResizeWindowCBClick(nil);
      end;
      if not MainForm.DisableResizeWindowCB.Checked then begin
        if r.ValueExists('Width') then MainForm.Width:=r.ReadInteger('Width');
        if r.ValueExists('Height') then MainForm.Height:=r.ReadInteger('Height');
      end;
      if MainForm.Width > Screen.WorkAreaWidth-50 then MainForm.Width:=Screen.WorkAreaWidth-50;
      if MainForm.Height > Screen.WorkAreaHeight-50 then MainForm.Height:=Screen.WorkAreaHeight - 50;

      if r.ValueExists('PopolnBases') then begin
        s:=r.ReadString('PopolnBases');
        if s<>'' then begin
          p:=1;
          repeat
            b:=Parse(',', s, p);
            if b<>'' then
              for i := 0 to MainForm.ListBases.Items.Count - 1 do
                if MainForm.ListBases.Items[i].SubItems[1]=b then begin
                  MainForm.ListBases.Items[i].Checked:=True;
                  break;
                end;
            inc(p);
          until b='';
        end
        else
          if MainForm.ListBases.Items.Count>0 then
            MessageDlg('Ошибка',
            'В сохраненных настройках не отмечены ни одной базы для пополнения'
            +' хотя в разделе "Базы" загружен список из '
            +IntToStr(MainForm.ListBases.Items.Count)+' баз.'+#13#10+
            'Зайдите в раздел "Базы" и настройте.', mtError, [mbOK], 0);

        MainForm.DatePopoln.Clear;
        for i:=1 to 10 do begin
          s:=r.ReadString(IntToStr(i)+'_Popoln');
          if s<>'' then
            MainForm.DatePopoln.Add(s);
        end;
      end;
    end
    else
      Exit(False);
  finally
    r.Free;
  end;
end;

end.
