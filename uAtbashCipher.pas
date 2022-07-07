unit uAtbashCipher;

interface

type
  TAtbashCipher = class
    class function Encode(AText : string) : string; static;
    class function Decode(AText : string) : string; static;
  end;

implementation
  uses
    System.SysUtils, System.StrUtils;

  class function TAtbashCipher.Encode(AText : string) : string;
    var
      AddedChar : integer;
    begin
      Result := '';
      AddedChar := 0;
      AText := AText.ToLower;
      for var i := Low(AText) to High(AText) do
        begin
          if ('a' <= Atext[i]) and (('z' >= Atext[i])) then
            begin
              Result := Result + chr(ord('z') - ord(AText[i]) + ord('a'));
              Inc(AddedChar);
              if (0 = (AddedChar mod 5)) then
                Result := Result + ' ';
            end;
          if ('0' <= Atext[i]) and (('9' >= Atext[i])) then
            begin
              Result := Result + Atext[i];
              Inc(AddedChar);
              if (0 = (AddedChar mod 5)) then
                Result := Result + ' ';
            end;
        end;
      Result := trim(Result);
    end;

  class function TAtbashCipher.Decode(AText : string) : string;
    begin
      AText := AText.ToLower;
      for var i := Low(AText) to High(AText) do
        begin
          if ('a' <= Atext[i]) and (('z' >= Atext[i])) then
            begin
              Result := Result + chr(ord('z') - ord(AText[i]) + ord('a'));
            end;
          if ('0' <= Atext[i]) and (('9' >= Atext[i])) then
            begin
              Result := Result + Atext[i];
            end;
        end;
    end;

end.
