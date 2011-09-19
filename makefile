en/mongodb.epub:	en/title.txt en/mongodb.markdown
	pandoc -o $@ $^

en/mongodb.mobi:	en/mongodb.epub
	kindleGen $^

es/mongodb.epub:	es/title.txt es/mongodb.markdown
	pandoc -o $@ $^

es/mongodb.mobi:	es/mongodb.epub
	kindleGen $^
