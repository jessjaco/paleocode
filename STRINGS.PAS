unit Strings;

{by Jesse, Matt, and Nick
 19 December 1995}

{----} interface {----}

uses
	CRT;

type
	StringType = array [0..255] of Char;

{BAM!} function StringLength (var AString : StringType) : Byte;
  {Given AString of StringType, returns the length of the string.}
{BAM!} procedure ClearStringResult (var AString : StringType);
  {Sets all char elements of the StringType array AString to Chr (0).}
{BAM!} procedure StringWriteLn (var AString : StringType);
  {Writes AString to the screen.  Does not write space pads at the
	 end of the string.  Moves the cursor to the beginning of the next
	 line.}
{BAM!} procedure StringWrite (var AString : StringType);
  {Writes AString to the screen.  Does not write space pads at the
	 end of the string.  The cursor remains at the next empty position
	 on the screen.}
{BAM!} procedure StringReadLn (var AString : StringType);
  {Reads a StringType from the keyboard into AString.  Return
	 characters are not considered part of the string.}
{BAM!} procedure Concat (S1, S2 : StringType; var StringResult : StringType);
  {Writes S1, and then immedaitely following, S2 into StringResult.
	 Concat "connects" two strings (back of first to front of second)
	 and puts them in StringResult.}
{BAM!} procedure Copy (Astring : StringType; Start, Count : Byte;
                       var ResultString : StringType);
  {Inserts Count characters of AString into ResultString starting at the
	 Start'th element in ResultString.}
{BAM!} function spos (tofind,s :stringtype):integer;
  {Returns the position at which the first character of the first
	 occurence of ToFind is located in S.}
{BAM!} procedure Delete (var S : StringType; StartPos, Count : Integer);
  {Causes Count consecutive characters (starting at position StartPos in S)
	 to be set equal to Chr (0).}
{BAM!} procedure StringInsert (var Astring : StringType;
                               var ResultString : StringType;
															 Start : Integer);
  {Inserts AString into ResultString starting at ResultString's
	 Start'th element.}

{----} implementation {----}

{--StringLength--}

function StringLength (var AString : StringType) : Byte;
var
  TempLength : Byte;
begin
	TempLength := 255;
	while ((not (TempLength < 0)) and (AString [TempLength] = Chr (0))
	or (AString [TempLength] = Chr (13))) do
  	begin
			Dec (TempLength);
    end;
  StringLength := TempLength;
end;

{--ClearStringResult--}

procedure ClearStringResult (var AString : StringType);
var
  Post : Byte;
begin
	for PosT := 0 to 255 do
  	begin
			AString [PosT] := Chr (0);
    end;
end;

{--StringWriteLn--}

procedure StringWriteLn (var AString : StringType);
var
  Post : Byte;
begin
	for PosT := 0 to StringLength (AString) do
		begin
    	Write (AString [PosT]);
		end;
  WriteLn;
end;

{--StringWrite--}

procedure StringWrite (var AString : StringType);
var
  Post : Byte;
begin
	for PosT := 0 to StringLength (AString) do
		begin
    	Write (AString [PosT]);
		end;
end;

{--StringReadLn--}

procedure StringReadLn (var AString : StringType);
var
  Post : Byte;
begin
	PosT := 0;
  ClearStringResult (AString);
	repeat
		AString [PosT] := ReadKey;
		if (not (AString [PosT] = Chr (13))) then
      begin
	Write (AString [PosT]);

      	Inc (PosT);
      end;
  until (AString [PosT] = Chr (13));
  AString [PosT] := Chr (0);
{  Write (Chr (13));}
	WriteLn;
end;

{--Concat--}

procedure Concat (S1, S2 : StringType; var StringResult : StringType);
var
 LengthOfS1, LengthOfS2, Pos : Byte;
begin
  LengthofS1 := StringLength (S1);
  LengthofS2 := StringLength (S2);
  for Pos := 0 to LengthofS1 do
    StringResult [Pos] := S1 [Pos];
  for Pos := LengthOfS1 + 0 to LengthOfS1 + LengthofS2 do
    StringResult [Pos] := S2 [Pos - LengthOfS1];
end;

{--Copy--}

procedure Copy (Astring : StringType; Start, Count : Byte;
                var ResultString : StringType);
var
  LengthofAString, Pos, OtherPos : Byte;
begin
{  if (count > StringLength (Astring)) then count := StringLength (AString);}
  OtherPos := 0;
  LengthofAString := StringLength (ResultString);
  for Pos := Start - 1 to Start + Count - 2 do
    begin
{      if (not (Pos > LengthOfAString)) then}
        ResultString [Pos] := AString [otherPos];
      Inc (OtherPos);
    end;
end;

{--IsTheSameAs--}

function IsTheSameAs (var S1, S2 : StringType) : Boolean;
var
  Pos : Byte;
begin
  IsTheSameAs := True;
  for Pos := 0 to StringLength (S1) do
    if (not (S1 [Pos] = S2 [pos])) then IsTheSameAs := False;
{  for Pos := 0 to StringLength (S2) do
    if (not (S1 [Pos] = S2 [Pos])) then IsTheSameAs := False;}
end;

{--Spos--}

function spos (tofind,s :stringtype):integer;
var
 slength,nbr,lcv:integer;
begin
 nbr:=0;
 lcv:=0;
 slength:=stringlength(s);
 while (nbr <= slength) and (lcv<stringlength(tofind)) do
  begin
   if s[nbr] = tofind[lcv] then
    lcv:=lcv+1
    else lcv:=0;
    nbr:=nbr+1;
  end;
 if lcv=(stringlength(tofind)) then
  spos:=(nbr-stringlength(tofind)+1)
 else spos:=0;
end;

{--Delete--}

procedure Delete (var S : StringType; StartPnDAϜ H��� I! �!�Ȥ�4)�8�� ψ5�)$B���2� �D��� �̀� ���8 �D��@H ���<�8D$�� L�x D��@�Hx D��@�Hx D��9�  ��d$�����Ȁ� ����� ��8 �8x D����8 �D$$�8�'$���D� x @���8L�<|$������� @H � @�H xH ��� H��@H � @�H�8�L��@H ���@H � x��������������������������L�H�@ @H ���@H � x�������������������������@�H�� ���L$�O�Count, LengthofAString, Pos, OtherPos : Byte;
begin
{  if (count > StringLength (Astring)) then count := StringLength (AString);}
  Count := StringLength (Astring);
  OtherPos := 0;
  LengthofAString := StringLength (ResultString);
  for Pos := Start - 1 to Start + Count - 1 do
    begin
{      if (not (Pos > LengthOfAString)) then}
        ResultString [Pos] := AString [otherPos];
      Inc (OtherPos);
    end;
end;

{--Unit--}

end.