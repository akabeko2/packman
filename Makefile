PICS=class.svg sequence.svg
PLANTUML=java -Djava.awt.headless=true -jar plantuml.jar

all: pics
pics: $(PICS)
.PHONY: all pics clean

plantuml.jar:
	curl -sS -L https://github.com/plantuml/plantuml/releases/download/v1.2025.10/plantuml-1.2025.10.jar -o $@

class.svg: class.puml plantuml.jar
	$(PLANTUML) -tsvg $<
sequence.svg: sequence.puml plantuml.jar
	$(PLANTUML) -tsvg $<

clean:
	-rm -rf $(PICS)
