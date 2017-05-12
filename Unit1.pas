unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MMSystem, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    octava: TTrackBar;
    GroupBox1: TGroupBox;
    PaintBox1: TPaintBox;
    ComboBox1: TComboBox;
    volume: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure octavaChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure volumeChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const nota:array[1..24] of integer = (0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,1,0);
      Instruments:array [0..127] of String=(
'AcousticGrandPiano', 'BrightAcousticPiano', 'ElectricGrandPiano', 'HonkyTonkPiano', 
'ElectricPiano1', 'ElectricPiano2', 'Harpsichord', 'Clavinet', 'Celesta', 'Glockenspiel',
'MusicBox', 'Vibraphone', 'Marimba', 'Xylophone', 'TubularBells', 'Dulcimer', 'DrawbarOrgan',
'PercussiveOrgan', 'RockOrgan', 'ChurchOrgan', 'ReedOrgan', 'Accordion', 'Harmonica',
'TangoAccordion', 'AcousticNylonGuitar', ' AcousticSteelGuitar', 'JazzElectricGuitar',
'CleanElectricGuitar', 'MutedElectricGuitar', 'OverdrivenGuitar', 'DistortionGuitar',
'GuitarHarmonics', 'AcousticBass', 'FingeredElectricBass', 'PickedElectricBass', 'FretlessBass',
'SlapBass1', 'SlapBass2', 'SynthBass1', 'SynthBass2', 'Violin', 'Viola', 'Cello', 'Contrabass',
'TremoloStrings', 'PizzicatoStrings', 'OrchestralHarp', 'Timpani', 'StringEnsemble1',
'StringEnsemble2', 'SynthStrings1', 'SynthStrings2', 'ChoirAahs', 'VoiceOohs', 'SynthVoice',
'OrchestraHit', 'Trumpet', 'Trombone', 'Tuba', 'MutedTrumpet', 'FrenchHorn', 'BrassSection',
'SynthBrass1', 'SynthBrass2', 'SopranoSax', 'AltoSax', 'TenorSax', 'BaritoneSax', 'Oboe',
'EnglishHorn', 'Bassoon', 'Clarinet', 'Piccolo', 'Flute', 'Recorder', 'PanFlute', 'BlownBottle',
'Shakuhachi', 'Whistle', 'Ocarina', 'SquareLead', 'SawtoothLead', 'CalliopeLead', 'ChiffLead',
'CharangLead', 'VoiceLead', 'FifthsLead', 'BassandLead', 'NewAgePad', 'WarmPad', 'PolySynthPad',
'ChoirPad', 'BowedPad', 'MetallicPad', 'HaloPad', 'SweepPad', 'SynthFXRain', 'SynthFXSoundtrack',
'SynthFXCrystal', 'SynthFXAtmosphere', 'SynthFXBrightness', 'SynthFXGoblins', 'SynthFXEchoes',
'SynthFXSciFi', 'Sitar', 'Banjo', 'Shamisen', 'Koto', 'Kalimba', 'Bagpipe', 'Fiddle', 'Shanai',
'TinkleBell', 'Agogo', 'SteelDrums', 'Woodblock', 'TaikoDrum', 'MelodicTom', 'SynthDrum',
'ReverseCymbal', 'GuitarFretNoise', 'BreathNoise', 'Seashore', 'BirdTweet', 'TelephoneRing',
'Helicopter', 'Applause', 'Gunshot');

var
  Form1: TForm1;
  hMidi, midimsg, no, oct, vol: integer;
  flag:boolean;

implementation

{$R *.dfm}

procedure drawpad(key:integer; pb:tcanvas);
var i,a:integer;
begin
  i:=0;
  a:=1;
  if key=-1 then repeat
    if nota[a]=0 then begin
      pb.Brush.Color:=clWhite;
      pb.Rectangle(i*20,0,(i+1)*20,100);
      i:=i+1;
    end;
    a:=a+1;
  until a>24;
  i:=0;
  a:=1;
  if key=-1 then repeat
    if nota[a]=1 then begin
      pb.Brush.Color:=clBlack;
      pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
      i:=i+2;
      if i=4 then i:=i+2;
      if i=12 then i:=i+2;
      if i=18 then i:=i+2;
    end;
    a:=a+1;
  until a>24;
  case Key of
        ord('A'): begin
                    pb.Brush.Color:=clred;
                    i:=0;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('S'): begin
                    pb.Brush.Color:=clred;
                    i:=1;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('D'): begin
                    pb.Brush.Color:=clred;
                    i:=2;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('F'): begin
                    pb.Brush.Color:=clred;
                    i:=3;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('G'): begin
                    pb.Brush.Color:=clred;
                    i:=4;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('H'): begin
                    pb.Brush.Color:=clred;
                    i:=5;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('J'): begin
                    pb.Brush.Color:=clred;
                    i:=6;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('K'): begin
                    pb.Brush.Color:=clred;
                    i:=7;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('L'): begin
                    pb.Brush.Color:=clred;
                    i:=8;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('є'): begin
                    pb.Brush.Color:=clred;
                    i:=9;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('Ю'): begin
                    pb.Brush.Color:=clred;
                    i:=10;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('d'): begin
                    pb.Brush.Color:=clred;
                    i:=11;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('e'): begin
                    pb.Brush.Color:=clred;
                    i:=12;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;
        ord('f'): begin
                    pb.Brush.Color:=clred;
                    i:=13;
                    pb.Rectangle(i*20,0,(i+1)*20,100);
                  end;




        ord('Q'): begin
                    pb.Brush.Color:=clred;
                    i:=0;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('W'): begin
                    pb.Brush.Color:=clred;
                    i:=2;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('E'): begin
                    pb.Brush.Color:=clred;
                    i:=6;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('R'): begin
                    pb.Brush.Color:=clred;
                    i:=8;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('T'): begin
                    pb.Brush.Color:=clred;
                    i:=10;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('Y'): begin
                    pb.Brush.Color:=clred;
                    i:=14;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('U'): begin
                    pb.Brush.Color:=clred;
                    i:=16;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('I'): begin
                    pb.Brush.Color:=clred;
                    i:=20;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('O'): begin
                    pb.Brush.Color:=clred;
                    i:=22;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
        ord('P'): begin
                    pb.Brush.Color:=clred;
                    i:=24;
                    pb.Rectangle(15+i*10,0,15+(i+1)*10,70);
                  end;
      end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  midiOutOpen(@hmidi, 0, 0, 0, 0);
  Form1.KeyPreview:= true;
  oct:=3;
  vol:=127;
  for i:=0 to 127 do combobox1.Items.Add(instruments[i]);
  combobox1.ItemIndex:=0;
  midimsg := $C0+$100*Combobox1.ItemIndex;
  midiOutShortMsg(hmidi, midimsg);
  flag:=true;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if flag=true then begin
    no:=-1;
    case Key of
      ord('A'): no:=12+(oct-1)*24;
      ord('S'): no:=14+(oct-1)*24;
      ord('D'): no:=16+(oct-1)*24;
      ord('F'): no:=17+(oct-1)*24;
      ord('G'): no:=19+(oct-1)*24;
      ord('H'): no:=21+(oct-1)*24;
      ord('J'): no:=23+(oct-1)*24;
      ord('K'): no:=24+(oct-1)*24;
      ord('L'): no:=26+(oct-1)*24;
      ord('є'): no:=28+(oct-1)*24;
      ord('Ю'): no:=29+(oct-1)*24;
      ord('d'): no:=31+(oct-1)*24;
      ord('e'): no:=33+(oct-1)*24;
      ord('f'): no:=35+(oct-1)*24;
      ord('Q'): no:=13+(oct-1)*24;
      ord('W'): no:=15+(oct-1)*24;
      ord('E'): no:=18+(oct-1)*24;
      ord('R'): no:=20+(oct-1)*24;
      ord('T'): no:=22+(oct-1)*24;
      ord('Y'): no:=25+(oct-1)*24;
      ord('U'): no:=27+(oct-1)*24;
      ord('I'): no:=30+(oct-1)*24;
      ord('O'): no:=32+(oct-1)*24;
      ord('P'): no:=34+(oct-1)*24;
    end;
    if no>-1 then if no<128 then begin
      drawpad(Key,PaintBox1.Canvas);
      midimsg := $90 + ((no) * $100) + (vol * $10000) + 0;
      midiOutShortMsg (hmidi, midimsg);
    end;
    flag:=false;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  midiOutClose(hmidi);
end;

procedure TForm1.octavaChange(Sender: TObject);
begin
  oct:=octava.Position;
  GroupBox1.Caption:=' Октава ' + inttostr(oct) + ' ';
  drawpad(-1,PaintBox1.Canvas);
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  flag:=true;
  no:=-1;
  case Key of
    ord('A'): no:=12+(oct-1)*24;
    ord('S'): no:=14+(oct-1)*24;
    ord('D'): no:=16+(oct-1)*24;
    ord('F'): no:=17+(oct-1)*24;
    ord('G'): no:=19+(oct-1)*24;
    ord('H'): no:=21+(oct-1)*24;
    ord('J'): no:=23+(oct-1)*24;
    ord('K'): no:=24+(oct-1)*24;
    ord('L'): no:=26+(oct-1)*24;
    ord('є'): no:=28+(oct-1)*24;
    ord('Ю'): no:=29+(oct-1)*24;
    ord('d'): no:=31+(oct-1)*24;
    ord('e'): no:=33+(oct-1)*24;
    ord('f'): no:=35+(oct-1)*24;
    ord('Q'): no:=13+(oct-1)*24;
    ord('W'): no:=15+(oct-1)*24;
    ord('E'): no:=18+(oct-1)*24;
    ord('R'): no:=20+(oct-1)*24;
    ord('T'): no:=22+(oct-1)*24;
    ord('Y'): no:=25+(oct-1)*24;
    ord('U'): no:=27+(oct-1)*24;
    ord('I'): no:=30+(oct-1)*24;
    ord('O'): no:=32+(oct-1)*24;
    ord('P'): no:=34+(oct-1)*24;
  end;
  if no>-1 then if no<128 then begin
    drawpad(-1,PaintBox1.Canvas);
    midimsg := $80 + ((no) * $100) +0 ;
    midiOutShortMsg (hmidi, midimsg);
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  midimsg := $C0+$100*Combobox1.ItemIndex;
  midiOutShortMsg(hmidi, midimsg);
  octava.SetFocus;
end;

procedure TForm1.volumeChange(Sender: TObject);
begin
  vol:=volume.Position;
  octava.SetFocus;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
   drawpad(-1,PaintBox1.Canvas);
end;

end.
