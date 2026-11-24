\version "2.24.0"

\header {
  title = "Canción a Magdalena"
  subtitle = "Acompañamiento de acordes (blancas) con letra"
  composer = "Autor e intérprete: Julio Zegers"
  tagline = ##f
}

\paper {
  #(set-paper-size "a4landscape")
  indent = 0
  system-system-spacing.basic-distance = #16
}

global = { \numericTimeSignature \key g \major \time 4/4 \tempo 4 = 80 }

acordes = \chordmode {
  \italianChords
  g2 d | e:m g | c a:7 | d d |
  b e:m | c g | a:7 d | g d |
}

% Ritmo neutro (no es la melodía) que sólo sirve para repartir
% las sílabas: cada verso ocupa 2 compases.
% Verso 1: 7 sílabas | Verso 2: 9 | Verso 3: 8 | Verso 4: 7
silabas = {
  \global
  c4 c c c | c c c2 |
  c8 c c c c4 c | c c c2 |
  c8 c c4 c c | c c c2 |
  c4 c c c | c c c2 |
}

% >>> Reemplaza este bloque completo por tu bloque lyricsText <<<
lyricsText = \lyricmode {
  Y Mag -- da -- le -- na ven -- drá
  Ca -- mi -- nan -- do del ce -- rro "hacia el" mar
  Mien -- tras su pue -- blo dor -- mi -- do
  Sue -- ña vol -- ver -- "la a en-" -- con -- trar.
}

manoDerecha = {
  \global \clef treble
  r1 | r1 | r1 | r1 | \break
  r1 | r1 | r1 | r1 \bar "|."
}

manoIzquierda = {
  \global \clef bass
  % SOL      RE            MIm         SOL
  <g, b, d>2\mp <d fis a>2 | <e g b>2 <g, b, d>2 |
  % DO       LA7               RE              RE
  <c e g>2 <a, cis e g>2 | <d fis a>2 <d fis a>2 |
  % SI          MIm         DO          SOL
  <b, dis fis>2 <e g b>2 | <c e g>2 <g, b, d>2 |
  % LA7            RE          SOL           RE
  <a, cis e g>2 <d fis a>2 | <g, b, d>2 <d fis a>2 \bar "|."
}

\score {
  <<
    \new ChordNames \acordes
    \new PianoStaff <<
      \new Staff = "MD" <<
        \manoDerecha
        \new NullVoice = "silabas" \silabas
      >>
      \new Lyrics \lyricsto "silabas" \lyricsText
      \new Staff = "MI" \manoIzquierda
    >>
  >>
  \layout { }
}
