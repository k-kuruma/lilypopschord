%% Kuruma,Keizo k@ nospam flat7th.org (please remove nospam)
\version "2.23.12"
\include "popsChord.ily"


myChord = \chordmode
{
  \key c \major

  \mark \markup \box {"power"}
  c1:5 c1:5.9
  s1 \bar "||"

  \mark \markup \box {"major 3rd"}
  c1:6 c1:6.9  c1:maj7 c1:maj9 c1:maj7.11 c1:maj7.11+ c1:maj7.13- c1:maj7.13
  s1 \bar "||"

  \mark \markup \box {"minor 3rd"}
  d1:m d1:m6 d1:m7 d1:m7.5- d1:m7.5+ d1:m9 d1:m7.11 d1:m7.11+ d1:m7.13- d1:m7.13
  s1 \bar "||"

  \mark \markup \box {"down cliche"}
  a1:m  a2:m7+/gis as2:aug  a1:m7/g fis1:m7.5- f1:maj7
  s1 \bar "||"

  \mark \markup \box {"Dominant 7th"}
  g1:7 g1:9- g1:9 g1:9+ g1:7.11 g1:7.11+ g1:7.13- g1:7.13
  g1:9-.11 g1:9-.11+ g1:9-.13- g1:9-.13
  g1:9.11 g1:9.11+ g1:9.13- g1:9.13
  g1:9+.11 g1:9+.11+ g1:9+.13- g1:9+.13
  s1 \bar "||"

  \break
  \mark \markup \box {"sharp on the root, or tension?"}
  gis1:9+ gis1:11+ e1:9-.13- des1:9-.13-
  s1 \bar "||"

  \mark \markup \box {"not support"}
  g1:9-.11+.13-_\markup { \fontsize #-2 {"no need full-13th ChordName"}}
  s1 s1 s1 \bar "||"

  \break
  \mark \markup \box {"7(dim)"}
  es1:7.5- es1:9-.5- es1:9.5- es1:9+.5-
  s1 \bar "||"
  \mark \markup \box {"7(aug)"}
  cis1:7.5+ cis1:9-.5+ cis1:9.5+ cis1:9+.5+
  s1 \bar "||"

  \mark \markup \box {"dim"}
  c1:dim c1:dim7 <c' es' ges' b'>1
  \bar "||"
  \mark \markup \box {"aug"}
  c1:aug c1:aug7 <c' e' gis' b'>1
  \bar "||"

  \mark \markup \box {"special"}
  <c' d' g'>1  <c' e' g' d''>1 <c' f' g'>1 <c' f' g' bes'>1 
  \bar "||"
}


\score {
  \transpose c c {
    <<
      \new ChordNames
      \with {
	chordRootNamer = #note-name->markup
	chordNameExceptions = #ignatzekExceptions
      }
      \chordmode {
	\set instrumentName = #"LilyPond 2.23 Standard ->"
	\myChord
      }

      \new ChordNames
      \chordmode {
	\set instrumentName = #"Pops Chord ->"
	\myChord
      }

      \new Voice
      \myChord
    >>
  }

  \layout {
    indent = 50\mm
    ragged-right = ##t

    \context {
      \ChordNames
      \consists "Instrument_name_engraver"
    }
  }
}
