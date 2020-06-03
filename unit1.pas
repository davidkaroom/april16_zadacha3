unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, my_module;

type

  { TKubik }

  TKubik = class(TForm)
    reb: TEdit;
    Button: TButton;
    Image: TImage;
    Result: TMemo;
    Podskazka2: TLabel;
    Podskazka: TLabel;
    MainMenu1: TMainMenu;
    Menu_file_saveas: TMenuItem;
    Menu_File_Save: TMenuItem;
    Menu_File_Open: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_Spravka: TMenuItem;
    Menu_File: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Menu_ExitClick(Sender: TObject);
    procedure Menu_File_OpenClick(Sender: TObject);
    procedure Menu_file_saveasClick(Sender: TObject);
    procedure Menu_File_SaveClick(Sender: TObject);
    procedure Menu_SpravkaClick(Sender: TObject);
  private

  public

  end;

var
  Kubik: TKubik;
  a,v,s:real;
implementation



{$R *.lfm}

{ TKubik }

procedure TKubik.Menu_File_OpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
      begin
        if OpenDialog1.FileName <> '' then
          begin
          loadparams(a, OpenDialog1.FileName);
          reb.Text  := floattostr( a );
          end;
      end;
end;

procedure TKubik.Menu_file_saveasClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
  Result.Lines.SaveToFile( SaveDialog1.FileName);
end;

procedure TKubik.Menu_File_SaveClick(Sender: TObject);
begin
   if SaveDialog1.Execute then
     begin
       if SaveDialog1.FileName <> '' then
         begin
         saveparam(a, SaveDialog1.FileName);
         end;
     end;
end;

procedure TKubik.Menu_SpravkaClick(Sender: TObject);
begin
  ShowMessage('Программа вычисляет площадь и ребро куба по формулам V=a^3 and S=a*a*6 Автор: Бурдуковский Давид');
end;

procedure TKubik.FormCreate(Sender: TObject);
begin
  Result.Lines.Clear; //очищаем от лишней информации
  a:=random(100);
  reb.Text:=FloatToStr(a);
end;

procedure TKubik.ButtonClick(Sender: TObject);
begin
 if TryStrToFloat(reb.Text, a) = false then
   begin
   ShowMessage('Неправильно введён параметр a');
   exit;
   end;
  a:=StrToFloat(reb.Text);
  v:=ob(a);
  s:=plosh(a);
  Result.Lines.Add('Объём куба со стороной '+ FloatToStr(a) +' равен '+ FloatToStr (v));
  Result.Lines.Add('Площадь боковой поверхности куба стороной '+ FloatToStr(a) + ' равна '+ FloatToStr(s));
end;

procedure TKubik.Menu_ExitClick(Sender: TObject);
begin
  close;
end;

end.

