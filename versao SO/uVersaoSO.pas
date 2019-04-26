unit uVersaoSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Label1: TLabel;
    function GetOSVersion(var MajorVersion, MinorVersion, Build: DWORD) : String;
    function ObterVersaoWindows : String;
    function IsWindows64: Boolean;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.GetOSVersion(var MajorVersion, MinorVersion,
  Build: DWORD): String;
var
  VersionInfo: TOSVersionInfo;
  vPlatform: string;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
 
  with VersionInfo do
  begin
    case dwPlatformId of
      VER_PLATFORM_WIN32s:
        vPlatform := 'Windows 3x';
      VER_PLATFORM_WIN32_WINDOWS:
        vPlatform := 'Windows 95';
      VER_PLATFORM_WIN32_NT:
        vPlatform := 'Windows NT'; // 2000, XP, Vista, 7, 8, 8.1
    end;
 
    MajorVersion := dwMajorVersion;
    MinorVersion := dwMinorVersion;
    Build := dwBuildNumber;
 
    Result := vPlatform;
  end;

end;

function TForm1.ObterVersaoWindows: String;
var
  vNome,
  vVersao,
  vCurrentBuild,
  VBits: String;
  Reg: TRegistry;
begin
  Reg         := TRegistry.Create; //Criando um Registro na Memória
  Reg.Access  := KEY_READ; //Colocando nosso Registro em modo Leitura
  Reg.RootKey := HKEY_LOCAL_MACHINE; //Definindo a Raiz

  //Abrindo a chave desejada
  Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\', true);

  //Obtendo os Parâmetros desejados
  vNome         := Reg.ReadString('ProductName');
  vVersao       := Reg.ReadString('CurrentVersion');
  vCurrentBuild := Reg.ReadString('CurrentBuild');

  if IsWindows64 = true then
  begin
    //Montando uma String com a Versão e alguns detalhes
   // Result := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild;
     // showmessage('O sistema windows é 64 Bits')
     Result := vNome + ' - ' + vVersao + ' - 64 Bits'
  end
  else
  begin
    //Montando uma String com a Versão e alguns detalhes
    //Result := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild;
    //showmessage('O sistema windows é 32 Bits');
    Result := vNome + ' - ' + vVersao + ' - 32 Bits'
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(ObterVersaoWindows);
end;

function TForm1.IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
  vIsWow64: BOOL;
begin
 
  Result := False;
 
  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit;
 
  try
 
  @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
  if not Assigned(vIsWow64Process) then Exit;
 
  vIsWow64 := False;
  if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
    Result := vIsWow64;
 
  finally
    FreeLibrary(vKernel32Handle);
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Label1.Caption := ObterVersaoWindows;
end;

end.
