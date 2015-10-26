Want to translate this book to some other language?
---------------------------------------------------

Keep in mind, it's a very hard and tedious work.
You'll need basic understanding of git, LaTeX and m4.
Aside from this, I do a lot of changes, so translators may need to syncronize their
work often.

But anyway, everything is simple: as you may see, all English text is enclosed in `\EN{}` 
LaTeX macro, all Russian text in `\RU{}`.
m4 (used here for assembly listings) has `_EN()` and` _RU()` macros.

Since translation project is large, work can be done gradually.
Try to start at ["patterns" directory] 
(https://github.com/dennis714/RE-for-beginners/tree/master/patterns).
There are also [lite (introductory) version](http://beginners.re/#lite), and that's a good idea to translate it first.
Translators may use git to get to know which TeX files are in somewhat stable state so can be 
translated before those parts which I still rework occasionally.

Choose a new macro name, for example, `\FR{}` for French or `\PTBR{}` for Brazilian Portuguese.
Create a new fork at Github and I'll setup everything to build a book in your language.
Or just send me files you had changed to `dennis(a)yurichev.com`.

In past, I often translated sentences by parts, so each sentence may contain several 
`\RU{}` and `\EN{}` macros, like [here](https://github.com/dennis714/RE-for-beginners/blob/b06840982e0c50c661b4327cbf5e32784cfe5b51/patterns/03_printf/x86/x86.tex#L98).
It was not a good idea, as I realized.
Better way to provide translations to a sentence is to list them, like [here](https://github.com/dennis714/RE-for-beginners/blob/06c668a6c57546239cc9dfa7f8c9cb24b5ab258c/patterns/00_ret/main.tex#L44):

    `\EN{English sentence.}`
    `\RU{Russian sentence.}`
    `\FR{French sentence.}`
    ...
    `\EN{Another English sentence.}`
    `\RU{Another Russian sentence.}`
    `\FR{Another French sentence.}`
    ...

Since this work can be done collaboratively, you may also use [my forum](http://forum.yurichev.com/viewforum.php?f=6) for coordination.
Github may also be used as well.

Do not be discouraged by the size of the whole project. 
Try to translate some small piece with familiar material to you.
Start the ball rolling, as they say. Some other translator may continue your work.

All your work will be licensed, like this book, in CC BY-NC-ND terms.
Korean, Chinese and Farsi translations are reserved by publishers.
English and Russian versions I maintain by myself, but any fixes are very welcome!

[Contact me](http://yurichev.com/contacts.html) for any questions.

Style
-----

I deeply convinced that technical literature should should be terse and formal.
Imagine you've got some reference book on your bookshelf.
You need it once a month, to get Pi exact value from it or something like that.
Perfect reference is a book where you'll see "Pi=3.14159..." and nothing else.
Informal or verbose language in technical books annoys you each time you looking up for the information you need.

Language
--------

On the other hand, terminology may be informal, just as typical modern IT bloggers use.
Don't hesitate to use English words in your language if this is norm in IT speech of your language and there are no good translation yet.
For example, Russian IT language is a mix of Russian and English words, and this is current language norm (at least in 2015), so I use this language in this book.

Spanish, Brazilian Portuguese and Polish macros
-----------------------------------------------

The macros for Spanish and Brazilian Portuguese are already defined: `\ES{}` and `\PTBR{}`.
Macro for Polish language is `\PL{}`.
You may start to translate right now.
To check your results, just run `make ES-lite`, `make PTBR-lite` `make polish-lite` (let's start with LITE version anyway).
You'll see almost blank pages with only listings and screenshots, without any text.
Grep for each `\EN{}` macro in .tex file and add your translation.
Same story with .m4 files, there are `_ES()`, `_PTBR()` and `_PL()` macros.

There is also `\ESph{}`, `\PTBRph{}` `\PLph{}` placeholder macros in .tex files, where the translated text must be.
You may start to translate there.

Do not hesitate to contact me if you have any questions.


