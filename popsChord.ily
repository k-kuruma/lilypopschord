%% Kuruma,Keizo k@ nospam flat7th.org (please remove nospam)
\version "2.23.12"

%% modification of the procedure "chordRootNamer", Pops Chord Name
%%---- Definition of chord alterations -------
%%  (based on https://github.com/artemispax/lilyscores)
#(define (popsChordRootNamer pitch majmin)  ;majmin is a required argument for "chordNamer", but not used here
  (let* ((alt (ly:pitch-alteration pitch)))
    (make-line-markup
      (list
        (make-simple-markup
          (vector-ref #("C" "D" "E" "F" "G" "A" "B")
            (ly:pitch-notename pitch)))
        (if (= alt 0)      ; alteration ?
          (markup "")      ; do nothing
          (make-line-markup ; markup sharp or flat
            (list
              (make-hspace-markup (if (= alt FLAT) 0.5 0.5))
              (make-fontsize-markup -2.5
                (make-raise-markup 1.2 (alteration->text-accidental-markup alt))
              )
              (make-hspace-markup (if (= alt SHARP) 0.2 0.1))
            ))
        )
      )
    )
  )
)

%% modification of the procedure "chordRootNamer", Roman Number Degree Chord Name
%% works only C Major. so need "translate to c" block on outside.
#(define (CMajDegreeNamer pitch majmin)  ;majmin is a required argument for "chordNamer", but not used here
  (let* ((alt (ly:pitch-alteration pitch)))
    (make-line-markup
      (list
        (if (= alt 0)      ; alteration ?
          (markup "")      ; do nothing
          (make-line-markup ; markup sharp or flat
            (list
              (make-hspace-markup (if (= alt FLAT) 0.5 0.5))
              (make-fontsize-markup -2.5
                (make-raise-markup 1.2 (alteration->text-accidental-markup alt))
              )
              (make-hspace-markup (if (= alt SHARP) 0.2 0.1))
            ))
        )
        (make-simple-markup
          (vector-ref #("I" "II" "III" "IV" "V" "VI" "VII")
            (ly:pitch-notename pitch)))
      )
    )
  )
)


%accSharp = \markup { \super \sharp }
%accFlat  = \markup { \super \flat }
accSharp = \markup { \musicglyph "accidentals.sharp.figbass" }
accFlat = \markup { \musicglyph "accidentals.flat.figbass" }

popsChordExceptMarkup = {
% power
  <c g>1-\markup		{ \fontsize #-1.5 { "5" } } % :5
  <c g d'>1-\markup		{ \fontsize #-2.5 { "59" } } % :5.9
  <c e g d'>1-\markup		{ \fontsize #-2.5 { "add9" } } % ?

% major 3rd
  <c e g a>1-\markup		{ \fontsize #-1.5 { "6" } } % :6
  <c e g a d'>1-\markup		{ \fontsize #-1.5 { "69" } } % :6.9
  <c e g b>1-\markup		{ \fontsize #-1.5 { #whiteTriangleMarkup "7" } } % :maj7
  <c e g b d'>1-\markup		{ \fontsize #-1.5 { #whiteTriangleMarkup "9" } } % :maj9
  <c e g b f'>1-\markup		{ \fontsize #-1.5 { #whiteTriangleMarkup "7" \super { "(11)" } } } % :maj7.11
  <c e g b fis'>1-\markup	{ \fontsize #-1.5 { #whiteTriangleMarkup "7" \super { "(" \accSharp "11)" } } } % :maj7.11+
  <c e g b as'>1-\markup	{ \fontsize #-1.5 { #whiteTriangleMarkup "7" \super { "(" \accFlat "13)" } } } % :maj7.13-
  <c e g b a'>1-\markup		{ \fontsize #-1.5 { #whiteTriangleMarkup "7" \super { "(13)" } } } % :maj7.13

% minor 3rd
  <c es g>1-\markup		{ \fontsize #-1.5 { "m" } } % :m
  <c es g a>1-\markup		{ \fontsize #-1.5 { "m6" } } % :m.6
  <c es g bes>1-\markup		{ \fontsize #-1.5 { "m7" } } % :m7
  <c es ges bes>1-\markup	{ \fontsize #-1.5 { "m7" \super { "(" \accFlat "5)" } } } % :m7.5-
  <c es gis bes>1-\markup	{ \fontsize #-1.5 { "m7" \super { "(" \accSharp "5)" } } } % :m7.5+
  <c es g bes d'>1-\markup	{ \fontsize #-1.5 { "m9" } } % :m9
  <c es g bes f'>1-\markup	{ \fontsize #-1.5 { "m7" \super { "(11)" } } } % :m7.11
  <c es g bes fis'>1-\markup	{ \fontsize #-1.5 { "m7" \super { "(" \accSharp "11)" } } } % :m7.11+
  <c es g bes as'>1-\markup	{ \fontsize #-1.5 { "m7" \super { "(" \accFlat "13)" } } } % :m7.13-
  <c es g bes a'>1-\markup	{ \fontsize #-1.5 { "m7" \super { "(13)" } } } % :m7.13
  <c es g b'>1-\markup		{ \fontsize #-1.5 { "m7" \super { "(maj7)" } } } % :m.maj7

% dominant 7th
  <c e g bes>1-\markup		{ \fontsize #-1.5 { "7" } } % :7
  <c e g bes d'>1-\markup	{ \fontsize #-1.5 { "9" } } % :9
  <c e g bes des'>1-\markup	{ \fontsize #-1.5 { "7" \super { "(" \accFlat "9)" } } } % :9-
  <c e g bes dis'>1-\markup	{ \fontsize #-1.5 { "7" \super { "(" \accSharp "9)" } } } % :9+
  <c e g bes f'>1-\markup	{ \fontsize #-1.5 { "7" \super { "(11)" } } } % :7.11
  <c e g bes fis'>1-\markup	{ \fontsize #-1.5 { "7" \super { "(" \accSharp "11)" } } } % :7.11+
  <c e g bes as'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(" \accFlat "13)" } } } % :7.13-
  <c e g bes a'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(13)" } } } % :7.13
  <c e g bes d' f'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(9,11)" } } } % :9.13
  <c e g bes d' fis'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(9," \accSharp "11)" } } } % :9.11+
  <c e g bes d' as'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(9," \accFlat "13)" } } } % :9.13-
  <c e g bes d' a'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(9,13)" } } } % :9.13
  <c e g bes des' f'>1-\markup   { \fontsize #-1.5 { "7" \super { "(" \accFlat "9,11)" } } } % :9-.11
  <c e g bes des' fis'>1-\markup { \fontsize #-1.5 { "7" \super { "(" \accFlat "9," \accSharp "11)" } } } % :9-.11+
  <c e g bes des' as'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(" \accFlat "9," \accFlat "13)" } } } % :9-.13-
  <c e g bes des' a'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(" \accFlat "9,13)" } } } % :9-.13
  <c e g bes dis' f'>1-\markup   { \fontsize #-1.5 { "7" \super { "(" \accSharp "9,11)" } } } % :9+.11
  <c e g bes dis' fis'>1-\markup { \fontsize #-1.5 { "7" \super { "(" \accSharp "9," \accSharp "11)" } } } % :9+.11+
  <c e g bes dis' as'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(" \accSharp "9," \accFlat "13)" } } } % :9+.13-
  <c e g bes dis' a'>1-\markup	 { \fontsize #-1.5 { "7" \super { "(" \accSharp "9,13)" } } } % :9+.13
  %% I don't need "g1:9-.11+.13-" etc.

% dominant 7th -5
  <c e ges bes>1-\markup	{ \fontsize #-1.5 { "7" } \super { "(" \accFlat "5)" } } % :7.5-
  <c e ges bes d'>1-\markup	{ \fontsize #-1.5 { "9" } \super { "(" \accFlat "5)" } } % :9.5-
  <c e ges bes des'>1-\markup	{ \fontsize #-1.5 { "7" } \super { "(" \accFlat "5," \accFlat "9)" } } % :9-.5-
  <c e ges bes dis'>1-\markup	{ \fontsize #-1.5 { "7" } \super { "(" \accFlat "5," \accSharp "9)" } } % :9+.5-

% dominant 7th +5
  <c e gis bes>1-\markup	{ \fontsize #-1.5 { "7" } \super { "(" \accSharp "5)" } } % :7.5+  :aug7
  <c e gis bes d'>1-\markup	{ \fontsize #-1.5 { "9" } \super { "(" \accSharp "5)" } } % :9.5+
  <c e gis bes des'>1-\markup	{ \fontsize #-1.5 { "7" } \super { "(" \accSharp "5," \accFlat "9)" } } % :9-.5+
  <c e gis bes dis'>1-\markup	{ \fontsize #-1.5 { "7" } \super { "(" \accSharp "5," \accSharp "9)" } } % :9+.5+

% diminish
  <c es ges>1-\markup		{ \fontsize #-2.5 { "dim5" } } % :dim
  <c es ges beses>1-\markup	{ \fontsize #-2.5 { "dim" } } % :dim7
  <c es ges b>1-\markup		{ \fontsize #-2.5 { "dim" \super { "(" #whiteTriangleMarkup "7)" } } }

% augument
  <c e gis>1-\markup		{ \fontsize #-2.5 { "aug" } } % :aug
  <c e gis b>1-\markup		{ \fontsize #-2.5 { "aug" \super { "(" #whiteTriangleMarkup "7)" } } }

% suspended
  <c d g>1-\markup		{ \fontsize #-3 { "sus2" } }
  <c f g>1-\markup		{ \fontsize #-3 { "sus4" } }
  <c f g bes>1-\markup		{ \fontsize #-1.5 { "7" } \fontsize #-3 { "sus4" }}

}

popsChordExcept = #(append
  (sequential-music-to-chord-exceptions popsChordExceptMarkup #t)
  ignatzekExceptions)

\layout {
  \override ChordName.font-family = #'roman
  \override ChordName.font-size = #2.0
  \context {
    \ChordNames

    chordRootNamer = #popsChordRootNamer  % update the chord names
    %%chordRootNamer = #CMajDegreeNamer   % update the chord names

    chordNameExceptions = #popsChordExcept  % update the chord exceptions
  }
}
