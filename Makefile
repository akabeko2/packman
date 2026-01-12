PICS=class.eps sequence.eps
PLANTUML=java -Djava.awt.headless=true -jar plantuml.jar

all: pics report.pdf
pics: $(PICS)
.PHONY: all pics clean

plantuml.jar:
	curl -sS -L https://github.com/plantuml/plantuml/releases/download/v1.2025.10/plantuml-1.2025.10.jar -o $@

class.eps: class.puml plantuml.jar
	$(PLANTUML) -teps $<
sequence.eps: sequence.puml plantuml.jar
	$(PLANTUML) -teps $<

report.pdf: report.tex
	latexmk -pdfdvi report.tex

clean:
	-rm -rf $(PICS)
	latexmk -C
