unit uUteis;

interface

uses dialogs;

procedure Mensagem(vMSG : string);

implementation

procedure Mensagem(vMSG : string);
begin
  MessageDlg(vMSG, mtInformation, [mbOK], 0);
end;

end.
