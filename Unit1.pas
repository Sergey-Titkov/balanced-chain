unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type

  TIntegerArray = array of Integer;

  TForm1 = class(TForm)
    lst1: TListBox;
    lst2: TListBox;
    lst3: TListBox;
    se1: TSpinEdit;
    btn1: TButton;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure agedWorkTask(var AValue: TIntegerArray);
    procedure moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
      var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
    procedure fillListCenter(const AList: TListBox;
  var AValue: TIntegerArray);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  byteQueryOfDeveloping: TIntegerArray;
  byteQueryOfTesting: TIntegerArray;
  byteQueryOfDocumention: TIntegerArray;
  byteCompliteTask: TIntegerArray;
  iGood: integer;
  iBad: integer;

implementation

{$R *.dfm}
// —остариваем все задачи в очереди на один день

procedure TForm1.agedWorkTask(var AValue: TIntegerArray);
var
  i: Integer;
begin
  for i := Low(AValue) to High(AValue) do
    begin
      Dec(AValue[i]);
    end;
end;

// —остариваем все задачи в очереди на один день

procedure TForm1.moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
  var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
var
  i: Integer;
begin
  // ѕерекидываем это количество в центр тестировани€ в конец
  for i := Low(ASourceQuery) to ANumberOfCompliteTasks - 1 do
    begin
      if i > High(ASourceQuery) then
        begin
          Break;
        end;
      SetLength(ADestQuery, Length(ADestQuery) + 1);
      ADestQuery[High(ADestQuery)] := ASourceQuery[i];
    end;
  ASourceQuery := Copy(ASourceQuery, ANumberOfCompliteTasks, Length(ASourceQuery));
end;

procedure TForm1.fillListCenter(const AList: TListBox;
  var AValue: TIntegerArray);
var
  i: Integer;
begin
  AList.Items.Clear;
  for i := Low(AValue) to High(AValue) do
    begin
      AList.Items.Add(IntToStr(AValue[i]));
    end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  iRate: byte;
  i: Integer;
begin
  Randomize;
  // ¬ыполн€ем работу в центре разработки
  agedWorkTask(byteQueryOfDeveloping);
  agedWorkTask(byteQueryOfTesting);
  agedWorkTask(byteQueryOfDocumention);

  // ƒобавл€ем новые задани€
  for i := 1 to se1.Value do
    begin
      SetLength(byteQueryOfDeveloping, Length(byteQueryOfDeveloping) + 1);
      byteQueryOfDeveloping[High(byteQueryOfDeveloping)] := 3;
    end;

  // ќпредел€ем сколько сделано работы


  iRate := Random(10);
  lb3.Caption := IntToStr(iRate);
  moveCopliteTaskToNextCenter(iRate,byteQueryOfDocumention,byteCompliteTask);

  // ѕерекидываем это количество в центр тестировани€ в конец
  for i := Low(byteCompliteTask) to High(byteCompliteTask) do
    begin
      if byteCompliteTask[i]>=0 then
        begin
          Inc(iGood);
        end
      else
        begin
          Inc(iBad)
        end;
    end;
  lb4.Caption := IntToStr(iGood);
  lb5.Caption := IntToStr(iBad);
  SetLength(byteCompliteTask,0);


  iRate := Random(10);
  lb2.Caption := IntToStr(iRate);
  moveCopliteTaskToNextCenter(iRate,byteQueryOfTesting,byteQueryOfDocumention);

  iRate := Random(10);
  lb1.Caption := IntToStr(iRate);
  moveCopliteTaskToNextCenter(iRate,byteQueryOfDeveloping,byteQueryOfTesting);


  // «аполн€ем лист центра разработки
  fillListCenter(lst1, byteQueryOfDeveloping);
  fillListCenter(lst2, byteQueryOfTesting);
  fillListCenter(lst3, byteQueryOfDocumention);


end;

end.

