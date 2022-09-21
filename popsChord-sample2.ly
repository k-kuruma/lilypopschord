\version "2.23.12"
\include "popsChord.ily"

myOriginalKey = c
myTargetKey = g

myChord = \chordmode
{
  \key c \major
  c2:maj7 a2:m7 | cis2:dim7 d2:m9 | as2:7.5- g4:7 b4:dim7 | c1:maj7 |
}

myMelody =
\relative c' {
  \key c \major
  c2 c | e2 e | d2 d | c1 |
}
\addlyrics {
  Do Do Mi Mi Re Re Do
}

\markup { \box {"Example 1: Pops Chord Names"} }

\score {

  \transpose \myOriginalKey \myTargetKey { % transpose OriginalKey to TargetKey
    <<
     \new ChordNames \myChord
     \new Staff \myMelody
    >>
  }

  \layout {
    \override LyricText.font-size = #-1.6
    \override ChordName.font-size = #2.0
    \context {
      \ChordNames
      chordRootNamer = #popsChordRootNamer  % update the chord names
    }
  }
}


\markup { \box { "Example 2: Pops Chord Names with Degree Chord Name" } }

\score {

  \transpose \myOriginalKey \myTargetKey { % transpose OriginalKey to TargetKey
    <<
      %%% Degree Chord Names
      \new ChordNames \with {
	\override ChordName.font-size = #-1
	chordRootNamer = #CMajDegreeNamer     % update the chord names
      }
      \transpose \myTargetKey c { % transpose back to "C" Key
	\myChord
      }

      %%% Normal Chord Names
      \new ChordNames \with {
	chordRootNamer = #popsChordRootNamer  % update the chord names
      }
      \myChord
      
      %%% Song
      \new Staff \myMelody
    >>
  }

  \layout {
    \override LyricText.font-size = #-1.6
    \override ChordName.font-size = #2.0
  }
}
