unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type

  TIntegerArray = array of Integer;

  TfmMain = class(TForm)
    lstOne: TListBox;
    lstTwo: TListBox;
    lstThree: TListBox;
    se1: TSpinEdit;
    btn1: TButton;
    lbOne: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lstFour: TListBox;
    lb7: TLabel;
    lstFive: TListBox;
    btn2: TButton;
    function getNumberCompliteTasks: Integer;
    procedure btn1Click(Sender: TObject);
    procedure agedWorkTask(var AValue: TIntegerArray);
    procedure moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
      var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
    procedure fillListCenter(const AList: TListBox;
      var AValue: TIntegerArray);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  PowerWorkCenter: Integer = 6;
var
  fmMain: TfmMain;
  byteQueryOfOne: TIntegerArray;
  byteQueryOfTwo: TIntegerArray;
  byteQueryOfThree: TIntegerArray;
  byteQueryOfFour: TIntegerArray;
  byteQueryOfFive: TIntegerArray;
  byteCompliteTask: TIntegerArray;
  iGood: integer;
  iBad: integer;

implementation

{$R *.dfm}
// Состариваем все задачи в очереди на один день

procedure TfmMain.agedWorkTask(var AValue: TIntegerArray);
var
  i: Integer;
begin
  for i := Low(AValue) to High(AValue) do
    begin
      Dec(AValue[i]);
    end;
end;

// Состариваем все задачи в очереди на один день

procedure TfmMain.moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
  var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
var
  i: Integer;
begin
  // Перекидываем это количество в центр тестирования в конец
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

procedure TfmMain.fillListCenter(const AList: TListBox;
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

// Возвращает сколько задач за ход выполнил рабочий центр. От 1 до ..  PowerWorkCenter

function TfmMain.getNumberCompliteTasks: Integer;
begin
  repeat
    Result := Random(PowerWorkCenter);
  until Result > 0;
end;

procedure TfmMain.btn1Click(Sender: TObject);
var
  iRate: byte;
  i: Integer;
begin
  // Добавляем новые задания
  for i := 1 to se1.Value do
    begin
      SetLength(byteQueryOfDeveloping, Length(byteQueryOfDeveloping) + 1);
      byteQueryOfDeveloping[High(byteQueryOfDeveloping)] := 5;
    end;
  // День прошел, в кармане доллар (c) Рик
  // Состариваем задачи находящиеся в каждом центре
  agedWorkTask(byteQueryOfOne);
  agedWorkTask(byteQueryOfTwo);
  agedWorkTask(byteQueryOfThree);
  agedWorkTask(byteQueryOfFour);
  agedWorkTask(byteQueryOfFive);

  // Определяем сколько сделано работы в каждом центре и переносим эти задачи дальше по цепочке
  // Центы обрабатываются в обратном порядке, для того что бы избежать эффекта телепортации задачи
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfFive, byteCompliteTask);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfFour, byteQueryOfFive);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfThree, byteQueryOfFour);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfTwo, byteQueryOfThree);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfOne, byteQueryOfTwo);

  // Визуализируем состояние очередей, для каждого центра разработки
  fillListCenter(lstOne, byteQueryOfOne);
  fillListCenter(lstTwo, byteQueryOfTwo);
  fillListCenter(lstThree, byteQueryOfThree);
  fillListCenter(lstFour, byteQueryOfFour);
  fillListCenter(lstFive, byteQueryOfFive);



  // Перекидываем это количество в центр тестирования в конец
  for i := Low(byteCompliteTask) to High(byteCompliteTask) do
    begin
      if byteCompliteTask[i] >= 0 then
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
  SetLength(byteCompliteTask, 0);


  iRate := getNumberCompliteTasks;
  lb2.Caption := IntToStr(iRate);
  moveCopliteTaskToNextCenter(iRate, byteQueryOfTesting, byteQueryOfDocumention);

  iRate := getNumberCompliteTasks;
  lb1.Caption := IntToStr(iRate);
  moveCopliteTaskToNextCenter(iRate, byteQueryOfDeveloping, byteQueryOfTesting);




end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Randomize;
end;

end.

