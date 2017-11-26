unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Vcl.ExtCtrls;

type

  TIntegerArray = array of Integer;

  TfmMain = class(TForm)
    lstOne: TListBox;
    lstTwo: TListBox;
    lstThree: TListBox;
    se1: TSpinEdit;
    btnProceedTurn: TButton;
    lstFour: TListBox;
    lstFive: TListBox;
    btnStartGame: TButton;
    tmTimer: TTimer;
    Label1: TLabel;
    lbBalans: TLabel;
    procedure doTurn(const ATaskToWork: integer);
    procedure updateStartTurnCaptiont;
    function getNumberCompliteTasks: Integer;
    procedure btnProceedTurnClick(Sender: TObject);
    procedure agedWorkTask(var AValue: TIntegerArray);
    procedure moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
      var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
    procedure fillListCenter(const AList: TListBox;
      var AValue: TIntegerArray);
    procedure FormCreate(Sender: TObject);
    procedure tmTimerTimer(Sender: TObject);
    procedure btnStartGameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  PowerWorkCenter: Integer = 6;
  TurnCost:        Integer = 10;
var
  iCountDown: integer;
  fmMain: TfmMain;
  byteQueryOfOne: TIntegerArray;
  byteQueryOfTwo: TIntegerArray;
  byteQueryOfThree: TIntegerArray;
  byteQueryOfFour: TIntegerArray;
  byteQueryOfFive: TIntegerArray;
  byteCompliteTask: TIntegerArray;
  iGood: integer;
  iBad: integer;
  iBalans: integer;
  iEarnByTurn: integer;

implementation

{$R *.dfm}
// ����������� ��� ������ � ������� �� ���� ����

procedure TfmMain.agedWorkTask(var AValue: TIntegerArray);
var
  i: Integer;
begin
  for i := Low(AValue) to High(AValue) do
    begin
      Dec(AValue[i]);
    end;
end;

// ����������� ��� ������ � ������� �� ���� ����

procedure TfmMain.moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
  var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
var
  i: Integer;
begin
  // ������������ ��� ���������� � ����� ������������ � �����
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

procedure TfmMain.updateStartTurnCaptiont;
begin
  btnProceedTurn.Caption := Format('������� ���. ��������: %d', [iCountDown]);
end;

// ���������� �������, ������ ������ �� ����������� ���� 15 ������
procedure TfmMain.tmTimerTimer(Sender: TObject);
begin
  if iCountDown = 0 then
    begin
      doTurn(Random(6));
    end
  else
    begin
      dec(iCountDown);
      updateStartTurnCaptiont
    end;
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

// ���������� ������� ����� �� ��� �������� ������� �����. �� 1 �� ..  PowerWorkCenter
function TfmMain.getNumberCompliteTasks: Integer;
begin
  repeat
    Result := Random(PowerWorkCenter);
  until Result > 0;
end;

// ��������� ���
procedure TfmMain.doTurn(const ATaskToWork: integer);
var
  i: Integer;
begin
  fmMain.Enabled  := false;
  tmTimer.Enabled := false;

  // ��������� ����� �������
  for i := 1 to ATaskToWork do
    begin
      SetLength(byteQueryOfOne, Length(byteQueryOfOne) + 1);
      byteQueryOfOne[High(byteQueryOfOne)] := 5;
    end;
  // ���� ������, � ������� ������ (c) ���
  // ����������� ������ ����������� � ������ ������
  agedWorkTask(byteQueryOfOne);
  agedWorkTask(byteQueryOfTwo);
  agedWorkTask(byteQueryOfThree);
  agedWorkTask(byteQueryOfFour);
  agedWorkTask(byteQueryOfFive);

  // ���������� ������� ������� ������ � ������ ������ � ��������� ��� ������ ������ �� �������
  // ����� �������������� � �������� �������, ��� ���� ��� �� �������� ������� ������������ ������
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfFive, byteCompliteTask);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfFour, byteQueryOfFive);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfThree, byteQueryOfFour);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfTwo, byteQueryOfThree);
  moveCopliteTaskToNextCenter(getNumberCompliteTasks, byteQueryOfOne, byteQueryOfTwo);

  // ������������� ��������� ��������, ��� ������� ������ ����������
  fillListCenter(lstOne, byteQueryOfOne);
  fillListCenter(lstTwo, byteQueryOfTwo);
  fillListCenter(lstThree, byteQueryOfThree);
  fillListCenter(lstFour, byteQueryOfFour);
  fillListCenter(lstFive, byteQueryOfFive);



  // ������������ ��� ���������� � ����� ������������ � �����
  iGood := 0;
  iBad  := 0;
  for i := Low(byteCompliteTask) to High(byteCompliteTask) do
    begin
      if byteCompliteTask[i] >= 0 then
        begin
          Inc(iGood, 5);
        end
      else
        begin
          Dec(iBad, byteCompliteTask[i]*-1);
        end;
    end;
  SetLength(byteCompliteTask, 0);
  iBalans := iBalans + iGood + iBad - TurnCost;
  lbBalans.Caption := IntToStr(iBalans);

  iCountDown      := 15;
  tmTimer.Enabled := true;
  fmMain.Enabled  := true;
  updateStartTurnCaptiont;
end;

procedure TfmMain.btnStartGameClick(Sender: TObject);
begin
  fmMain.Enabled  := false;
  tmTimer.Enabled := false;
  iBalans := 50;
  iCountDown := 15;
  SetLength(byteQueryOfOne, 0);
  SetLength(byteQueryOfTwo, 0);
  SetLength(byteQueryOfThree, 0);
  SetLength(byteQueryOfFour, 0);
  SetLength(byteQueryOfFive, 0);

  lstOne.Items.Clear;
  lstTwo.Items.Clear;
  lstThree.Items.Clear;
  lstFour.Items.Clear;
  lstFive.Items.Clear;
  updateStartTurnCaptiont;
  tmTimer.Enabled := true;
  fmMain.Enabled  := true;
end;

procedure TfmMain.btnProceedTurnClick(Sender: TObject);
begin
  doTurn(se1.Value);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Randomize;
end;

end.

