unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, SynCommons;

type

  TIntegerArray = array of Integer;

  TfmMain = class(TForm)
    se1: TSpinEdit;
    btnProceedTurn: TButton;
    btnStartGame: TButton;
    tmTimer: TTimer;
    Label1: TLabel;
    lbBalans: TLabel;
    gb1: TGroupBox;
    lb1: TLabel;
    lbQueryLengthCenterOne: TLabel;
    lb3: TLabel;
    sePowerOfCenetrOne: TSpinEdit;
    lb4: TLabel;
    lbFreePower: TLabel;
    gb2: TGroupBox;
    lb6: TLabel;
    lbQueryLengthCenterTwo: TLabel;
    lb8: TLabel;
    sePowerOfCenetrTwo: TSpinEdit;
    gb3: TGroupBox;
    lb9: TLabel;
    lbQueryLengthCenterThree: TLabel;
    lb11: TLabel;
    sePowerOfCenetrThree: TSpinEdit;
    gb4: TGroupBox;
    lb12: TLabel;
    lbQueryLengthCenterFour: TLabel;
    lb14: TLabel;
    sePowerOfCenetrFour: TSpinEdit;
    gb5: TGroupBox;
    lb15: TLabel;
    lbQueryLengthCenterFive: TLabel;
    lb17: TLabel;
    sePowerOfCenetrFive: TSpinEdit;
    procedure OnSpeedEditButtonUpClick(Sender: TObject);
    procedure OnSpeedEditButtonDownClick(Sender: TObject);
    function TIntegerArrayToString(var AValue: TIntegerArray): string;
    procedure doTurn(const ATaskToWork: integer);
    procedure updateStartTurnCaptiont;
    function getNumberCompliteTasks: Integer;
    procedure btnProceedTurnClick(Sender: TObject);
    procedure agedWorkTask(var AValue: TIntegerArray);
    procedure moveCopliteTaskToNextCenter(const ANumberOfCompliteTasks: Integer;
      var ASourceQuery: TIntegerArray; var ADestQuery: TIntegerArray);
    procedure fillListCenter(const ALabel: TLabel;
      var AValue: TIntegerArray);
    procedure FormCreate(Sender: TObject);
    procedure tmTimerTimer(Sender: TObject);
    procedure btnStartGameClick(Sender: TObject);
    procedure sePowerOfCenetrOneKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  PowerWorkCenter: Integer = 6;
  TurnCost: Integer = 10;
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
  iFreePower: Integer;
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

function TfmMain.TIntegerArrayToString(var AValue: TIntegerArray): string;
var
  i: Integer;
  sTmp: string;
begin
  for i := Low(AValue) to High(AValue) do
    begin
      sTmp := sTmp + IntToString(AValue[i]);
      if i <> High(AValue) then
        begin
          sTmp := sTmp + ', ';
        end;
    end;
  result := '[ ' + sTmp + ' ]';
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

procedure TfmMain.fillListCenter(const ALabel: TLabel;
  var AValue: TIntegerArray);

begin
  ALabel.Caption := IntToString(Length(AValue));

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
  iDoTask: Integer;
  ILog: ISynLog;
  sBefore: string;
  sAfter: string;
begin
  ILog := TSynLog.Enter(self, 'doTurn');

  fmMain.Enabled := false;
  tmTimer.Enabled := false;
  ILog.Log(sllInfo, '��������� ����� �������');
  // ��������� ����� �������
  sBefore := TIntegerArrayToString(byteQueryOfOne);
  for i := 1 to ATaskToWork do
    begin
      SetLength(byteQueryOfOne, Length(byteQueryOfOne) + 1);
      byteQueryOfOne[High(byteQueryOfOne)] := 5;
    end;
  sAfter := TIntegerArrayToString(byteQueryOfOne);
  ILog.Log(sllInfo, '����� 1, ����� �������: %, ��������� �������: % => %', [IntToStr(ATaskToWork), sBefore, sAfter]);
  // ���� ������, � ������� ������ (c) ���
  // ����������� ������ ����������� � ������ ������
  sBefore := TIntegerArrayToString(byteQueryOfOne);
  agedWorkTask(byteQueryOfOne);
  sAfter := TIntegerArrayToString(byteQueryOfOne);
  ILog.Log(sllInfo, '����� 1, ������ ����: % => %', [sBefore, sAfter]);

  sBefore := TIntegerArrayToString(byteQueryOfTwo);
  agedWorkTask(byteQueryOfTwo);
  sAfter := TIntegerArrayToString(byteQueryOfTwo);
  ILog.Log(sllInfo, '����� 2, ������ ����: % => %', [sBefore, sAfter]);

  sBefore := TIntegerArrayToString(byteQueryOfThree);
  agedWorkTask(byteQueryOfThree);
  sAfter := TIntegerArrayToString(byteQueryOfThree);
  ILog.Log(sllInfo, '����� 3, ������ ����: % => %', [sBefore, sAfter]);

  sBefore := TIntegerArrayToString(byteQueryOfFour);
  agedWorkTask(byteQueryOfFour);
  sAfter := TIntegerArrayToString(byteQueryOfFour);
  ILog.Log(sllInfo, '����� 4, ������ ����: % => %', [sBefore, sAfter]);

  sBefore := TIntegerArrayToString(byteQueryOfFive);
  agedWorkTask(byteQueryOfFive);
  sAfter := TIntegerArrayToString(byteQueryOfFive);
  ILog.Log(sllInfo, '����� 5, ������ ����: % => %', [sBefore, sAfter]);


  // ���������� ������� ������� ������ � ������ ������ � ��������� ��� ������ ������ �� �������
  // ����� �������������� � �������� �������, ��� ���� ��� �� �������� ������� ������������ ������
  SetLength(byteCompliteTask, 0);
  iDoTask := getNumberCompliteTasks;
  sBefore := TIntegerArrayToString(byteQueryOfFive);
  moveCopliteTaskToNextCenter(iDoTask, byteQueryOfFive, byteCompliteTask);
  sAfter := TIntegerArrayToString(byteQueryOfFive);
  ILog.Log(sllInfo, '����� 5, ��������� �����: %, ��������� �������: % => % CR', [IntToString(iDoTask), sBefore, sAfter]);

  iDoTask := getNumberCompliteTasks;
  ILog.Log(sllInfo, '����� 4, ��������� �����: %', [IntToString(iDoTask)]);
  sBefore := TIntegerArrayToString(byteQueryOfFour);
  sAfter := TIntegerArrayToString(byteQueryOfFive);
  moveCopliteTaskToNextCenter(iDoTask, byteQueryOfFour, byteQueryOfFive);
  ILog.Log(sllInfo, '����� 4, ��������� �������: % => %', [sBefore, TIntegerArrayToString(byteQueryOfFour)]);
  ILog.Log(sllInfo, '����� 5, ��������� �������: % => % CR', [sAfter, TIntegerArrayToString(byteQueryOfFive)]);


  iDoTask := getNumberCompliteTasks;
  ILog.Log(sllInfo, '����� 3, ��������� �����: %', [IntToString(iDoTask)]);
  sBefore := TIntegerArrayToString(byteQueryOfThree);
  sAfter := TIntegerArrayToString(byteQueryOfFour);
  moveCopliteTaskToNextCenter(iDoTask, byteQueryOfThree, byteQueryOfFour);
  ILog.Log(sllInfo, '����� 3, ��������� �������: % => %', [sBefore, TIntegerArrayToString(byteQueryOfThree)]);
  ILog.Log(sllInfo, '����� 4, ��������� �������: % => % CR', [sAfter, TIntegerArrayToString(byteQueryOfFour)]);

  iDoTask := getNumberCompliteTasks;
  ILog.Log(sllInfo, '����� 2, ��������� �����: %', [IntToString(iDoTask)]);
  sBefore := TIntegerArrayToString(byteQueryOfTwo);
  sAfter := TIntegerArrayToString(byteQueryOfThree);
  moveCopliteTaskToNextCenter(iDoTask, byteQueryOfTwo, byteQueryOfThree);
  ILog.Log(sllInfo, '����� 2, ��������� �������: % => %', [sBefore, TIntegerArrayToString(byteQueryOfTwo)]);
  ILog.Log(sllInfo, '����� 3, ��������� �������: % => % CR', [sAfter, TIntegerArrayToString(byteQueryOfThree)]);

  iDoTask := getNumberCompliteTasks;
  ILog.Log(sllInfo, '����� 1, ��������� �����: %', [IntToString(iDoTask)]);
  sBefore := TIntegerArrayToString(byteQueryOfOne);
  sAfter := TIntegerArrayToString(byteQueryOfTwo);
  moveCopliteTaskToNextCenter(iDoTask, byteQueryOfOne, byteQueryOfTwo);
  ILog.Log(sllInfo, '����� 1, ��������� �������: % => %', [sBefore, TIntegerArrayToString(byteQueryOfOne)]);
  ILog.Log(sllInfo, '����� 2, ��������� �������: % => % CR', [sAfter, TIntegerArrayToString(byteQueryOfTwo)]);

  // ������������� ��������� ��������, ��� ������� ������ ����������
  fillListCenter(lbQueryLengthCenterOne, byteQueryOfOne);
  fillListCenter(lbQueryLengthCenterTwo, byteQueryOfTwo);
  fillListCenter(lbQueryLengthCenterThree, byteQueryOfThree);
  fillListCenter(lbQueryLengthCenterFour, byteQueryOfFour);
  fillListCenter(lbQueryLengthCenterFive, byteQueryOfFive);



  // ������������ ��� ���������� � ����� ������������ � �����
  sBefore := TIntegerArrayToString(byteCompliteTask);
  ILog.Log(sllInfo, '������� �����. ������� ��������� �����: %', [sBefore]);
  iGood := 0;
  iBad := 0;
  for i := Low(byteCompliteTask) to High(byteCompliteTask) do
    begin
      if byteCompliteTask[i] >= 0 then
        begin
          Inc(iGood, 5);
          ILog.Log(sllInfo, '������ [%] = %. �� ��� ������ +5', [IntToStr(i), IntToStr(byteCompliteTask[i])]);
        end
      else
        begin
          Dec(iBad, byteCompliteTask[i] * -1);
          ILog.Log(sllInfo, '������ [%] = %. �� ��� ������ %', [IntToStr(i), IntToStr(byteCompliteTask[i]), IntToStr(byteCompliteTask[i] * 1)]);
        end;
    end;
  SetLength(byteCompliteTask, 0);
  ILog.Log(sllInfo, '�����: %, ����: %, ��������� ������������: %, ������: % CR', [IntToStr(iGood), IntToStr(iBad), IntToStr(TurnCost), IntToStr(iGood + iBad - TurnCost)]);
  iBalans := iBalans + iGood + iBad - TurnCost;
  lbBalans.Caption := IntToStr(iBalans);

  iCountDown := 15;
  tmTimer.Enabled := true;
  fmMain.Enabled := true;
  updateStartTurnCaptiont;
end;

procedure TfmMain.btnStartGameClick(Sender: TObject);
begin
  fmMain.Enabled := false;
  tmTimer.Enabled := false;
  iBalans := 50;
  lbBalans.Caption := IntToStr(iBalans);
  iCountDown := 15;
  SetLength(byteQueryOfOne, 0);
  SetLength(byteQueryOfTwo, 0);
  SetLength(byteQueryOfThree, 0);
  SetLength(byteQueryOfFour, 0);
  SetLength(byteQueryOfFive, 0);

  lbQueryLengthCenterOne.Caption := '0';
  lbQueryLengthCenterTwo.Caption := '0';
  lbQueryLengthCenterThree.Caption := '0';
  lbQueryLengthCenterFour.Caption := '0';
  lbQueryLengthCenterFive.Caption := '0';

  sePowerOfCenetrOne.Value := 6;
  sePowerOfCenetrTwo.Value := 6;
  sePowerOfCenetrThree.Value := 6;
  sePowerOfCenetrFour.Value := 6;
  sePowerOfCenetrFive.Value := 6;

  iFreePower := 0;
  lbFreePower.Caption := '0';

  updateStartTurnCaptiont;
  btnProceedTurn.Enabled := true;
  tmTimer.Enabled := true;
  fmMain.Enabled := true;
end;

procedure TfmMain.btnProceedTurnClick(Sender: TObject);
begin
  doTurn(se1.Value);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Randomize;
  iFreePower := 0;
  with TSynLog.Family do begin
      Level := LOG_VERBOSE;
    //Level := [sllException,sllExceptionOS];
    //HighResolutionTimestamp := true;
    //AutoFlushTimeOut := 5;
      OnArchive := EventArchiveSynLZ;
    //OnArchive := EventArchiveZip;
      ArchiveAfterDays := 1; // archive after one day
    end;

  sePowerOfCenetrOne.Button.OnUpClick := OnSpeedEditButtonUpClick;
  sePowerOfCenetrOne.Button.OnDownClick := OnSpeedEditButtonDownClick;

  sePowerOfCenetrTwo.Button.OnUpClick := OnSpeedEditButtonUpClick;
  sePowerOfCenetrTwo.Button.OnDownClick := OnSpeedEditButtonDownClick;

  sePowerOfCenetrThree.Button.OnUpClick := OnSpeedEditButtonUpClick;
  sePowerOfCenetrThree.Button.OnDownClick := OnSpeedEditButtonDownClick;

  sePowerOfCenetrFour.Button.OnUpClick := OnSpeedEditButtonUpClick;
  sePowerOfCenetrFour.Button.OnDownClick := OnSpeedEditButtonDownClick;

  sePowerOfCenetrFive.Button.OnUpClick := OnSpeedEditButtonUpClick;
  sePowerOfCenetrFive.Button.OnDownClick := OnSpeedEditButtonDownClick;

end;

procedure TfmMain.sePowerOfCenetrOneKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfmMain.OnSpeedEditButtonUpClick(Sender: TObject);
begin
  if iFreePower > 0 then
    begin
      Dec(iFreePower);
      TSpinEdit(TSpinButton(Sender).Parent).Value := TSpinEdit(TSpinButton(Sender).Parent).Value+1;
      lbFreePower.Caption := IntToString(iFreePower);
    end;

end;

procedure TfmMain.OnSpeedEditButtonDownClick(Sender: TObject);
begin
  if TSpinEdit(TSpinButton(Sender).Parent).Value > 1 then
    begin
      Inc(iFreePower);
      TSpinEdit(TSpinButton(Sender).Parent).Value := TSpinEdit(TSpinButton(Sender).Parent).Value-1;
      lbFreePower.Caption := IntToString(iFreePower);
    end;
end;

end.

