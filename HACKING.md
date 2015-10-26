It's possible to build your own version of book by choosing, what to include.

For example, one may not be interested in MIPS, ARM or Java.

Options enumerated in the [contents.tex](https://github.com/dennis714/RE-for-beginners/blob/master/contents.tex) file.

Remove some or comment with percent sign ('%').

In general, anyone can comment any `\input` LaTeX instruction to reduce whole size of the book.
No special TeX/LaTeX knowledge required.
So feel free to do it.
Some points of interest are: 
[point where main parts are enumerated](https://github.com/dennis714/RE-for-beginners/blob/master/parts.tex);
[point where chapters in 'pattern' part are enumerated](https://github.com/dennis714/RE-for-beginners/blob/f449775bacd0563f73082eb9985c1412055de5d1/patterns/main.tex#L201).

As a shortcoming, some references may broke (in case it's referencing to the part had been omitted), 
like "?? on page ??" -- but that's normal.

It's also possible to reorder parts.

