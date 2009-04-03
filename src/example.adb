with Ada.Text_IO;
with Ada.Exceptions;
with Getopt;

procedure example is
  package Exceptions renames Ada.Exceptions;
  package IO renames Ada.Text_IO;

  Option           : Integer;
  Option_Character : Character;
begin
  loop
    begin
      Option := Getopt.Process ("abcx:y:z:?");
      exit when Option = Getopt.Option_EOF;

      Option_Character := Character'Val (Option);
      case Option_Character is
        when 'a'    => IO.Put_Line ("-a");
        when 'b'    => IO.Put_Line ("-b");
        when 'c'    => IO.Put_Line ("-c");
        when 'x'    => IO.Put_Line ("-x " & Getopt.Option_Argument);
        when 'y'    => IO.Put_Line ("-y " & Getopt.Option_Argument);
        when 'z'    => IO.Put_Line ("-z " & Getopt.Option_Argument);
        when '?'    => IO.Put_Line ("-?");
        when others => null;
      end case;
    exception
      when Ex : Getopt.Argument_Required =>
        IO.Put_Line ("error: " & Exceptions.Exception_Message (Ex));
      when Ex : Getopt.Argument_Illegal =>
        IO.Put_Line ("error: " & Exceptions.Exception_Message (Ex));
    end;
  end loop;
end example;
